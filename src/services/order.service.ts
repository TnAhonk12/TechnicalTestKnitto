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

      // Cari customer berdasarkan alamat
      const [cust]: any = await conn.query(
        `SELECT id, email, customer_name FROM users WHERE address = ?`,
        [address]
      );
      if (cust.length === 0) throw { status: 404, message: "Customer tidak ditemukan." };

      const customerId = cust[0].id;
      const customerEmail = cust[0].email;
      const customer_name = cust[0].customer_name;

      // Buat kode order baru
      const newCode = generateOrderCodeNew(customerId);

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



  // async createLog(customerName: string, itemName: string, quantity: number) {
  //   const conn = await db.getConnection();
  //   await conn.beginTransaction();

  //   try {
  //     const timestamp = new Date().toISOString();

  //     const [cust]: any = await conn.query(
  //       `SELECT id, email, address FROM user WHERE customer_name = ?`,
  //       [customerName]
  //     );
  //     if (cust.length === 0) throw { status: 404, message: "Customer tidak ditemukan." };

  //     const [item]: any = await conn.query(
  //       `SELECT id, price FROM items WHERE item_name = ?`,
  //       [itemName]
  //     );
  //     if (item.length === 0) throw { status: 404, message: "Item tidak ditemukan." };

  //     const customerId = cust[0].id;
  //     const customerEmail = cust[0].email;
  //     const address = cust[0].address;

  //     const itemId = item[0].id;
  //     const itemPrice = item[0].price;

  //     const [orders]: any = await conn.query(
  //       `SELECT id, code FROM orders WHERE customer_id = ? AND item_id = ? AND qty = ? ORDER BY id DESC LIMIT 1`,
  //       [customerId, itemId, quantity]
  //     );

  //     if (orders.length === 0) throw { status: 404, message: "Order tidak ditemukan." };

  //     const orderId = orders[0].id;
  //     const orderCode = orders[0].code;

  //     await conn.query(`INSERT INTO logs (order_id) VALUES (?)`, [orderId]);

  //     // Simpan order ke file JSON
  //     const orderData = {
  //       no_order: orderCode,
  //       id_customer: customerId,
  //       name: customerName,
  //       email: customerEmail,
  //       address,
  //       payment_type: "Transfer",
  //       items: [
  //         {
  //           id_product: itemId,
  //           name: itemName,
  //           price: itemPrice,
  //           qty: quantity
  //         }
  //       ],
  //       total: itemPrice * quantity,
  //       status: "Order Diterima"
  //     };

  //     await saveOrderToFile(orderData, orderCode);

  //     await conn.commit();

  //     return {
  //       message: "Logs berhasil dibuat dan file order disimpan",
  //       order_id: orderId,
  //       customer_name: customerName,
  //       item_name: itemName,
  //       quantity,
  //       time: timestamp,
  //     };
  //   } catch (error) {
  //     await conn.rollback();
  //     throw error;
  //   } finally {
  //     conn.release();
  //   }
  // }

