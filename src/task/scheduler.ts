import cron from "node-cron";
import { logScheduledTask } from "../services/scheduler.service";

cron.schedule("* * * * *", async () => {
  try {
    await logScheduledTask();
    console.log("Task log berhasil disimpan");
  } catch (err) {
    console.error("Gagal menyimpan task log:", err);
  }
});
