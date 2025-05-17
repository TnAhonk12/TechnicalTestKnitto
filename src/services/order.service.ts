import { db } from "../db/mysql";
import { saveOrderToFile } from "../utils/logger";
import { generateOrderCodeNew } from "../utils/generateOrderCode";

export const OrderService = {
  async createOrder(payload: {
    address: string;
    payment_type: string;
    items: {
      id_product: number;
      name: string;
      price: number;
      qty: number;
    }[];
  }) {
    const conn = await db.getConnection();
    await conn.beginTransaction();

    try {
      const { address, payment_type, items } = payload;

     // Dapatkan customer
    const [cust]: any = await conn.query(
      `SELECT id, email, customer_name FROM users WHERE address = ?`,
      [address]
    );
    if (cust.length === 0) throw { status: 404, message: "Customer tidak ditemukan." };

    const customerId = cust[0].id;
    const customerEmail = cust[0].email;
    const customer_name = cust[0].customer_name;

    // Hitung tanggal sekarang
    const now = new Date();
    const datePart = `${String(now.getDate()).padStart(2, "0")}${String(now.getMonth() + 1).padStart(2, "0")}${String(now.getFullYear()).slice(2)}`;

    // Ambil last code berdasarkan tanggal & customer
    const [orders]: any = await conn.query(
      `SELECT code FROM orders 
      WHERE customer_id = ? AND code LIKE ? 
      ORDER BY id DESC LIMIT 1`,
      [customerId, `%${datePart}%`]
    );
    const lastCode = orders[0]?.code || null;

    // Generate new code
    const newCode = generateOrderCodeNew(customerId, lastCode);


      let total = 0;

      for (const item of items) {
        // Langsung gunakan data dari payload tanpa query ulang
        await conn.query(
          `INSERT INTO orders (code, customer_id, item_id, qty) VALUES (?, ?, ?, ?)`,
          [newCode, customerId, item.id_product, item.qty]
        );

        total += item.price * item.qty;
      }

      const orderData = {
        no_order: newCode,
        id_customer: customerId,
        name: customer_name,
        email: customerEmail,
        address,
        payment_type,
        items,
        total,
        status: "Order Diterima"
      };

      await saveOrderToFile(orderData, newCode);
      await conn.commit();

      return {
        message: "Order berhasil diproses",
        result: {
          order_number: newCode
        }
      };
    } catch (err) {
      await conn.rollback();
      throw err;
    } finally {
      conn.release();
    }
  }
};

