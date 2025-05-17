import { Request, Response } from "express";
import { OrderService } from "../services/order.service";

export const createOrderController = async (req: Request, res: Response) => {
  try {
    // Delay async 3 detik (non-blocking)
    await new Promise(resolve => setTimeout(resolve, 3000));

    const result = await OrderService.createOrder(req.body);

    res.status(201).json({ result});
  } catch (error: any) {
    console.error("Gagal membuat order:", error);
    res.status(error.status || 500).json({ error: error.message || "Terjadi kesalahan" });
  }
};
