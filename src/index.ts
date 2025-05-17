import express, { Router } from "express";
import dotenv from "dotenv";
import orderRoutes from "./routes/order.route";

import { runOrderWorker } from "./workers/orderWorker";

dotenv.config();

const app = express();
app.use(express.json());

app.use("/", orderRoutes);
setInterval(runOrderWorker, 10_000);

app.listen(process.env.PORT, () => {
  console.log(`Server running on port ${process.env.PORT}`);
});
