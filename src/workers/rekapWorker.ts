import fs from "fs/promises";
import path from "path";

const DELIVERED_DIR = path.join(__dirname, "../database/delivered-order");
const REKAP_DIR = path.join(__dirname, "../database/rekap-order");
const REKAP_FILENAME = "REKAP-ORDER-011224.json";
const LOG_FILENAME = "rekap-log.json";

async function getRekapLog(): Promise<string[]> {
  const logPath = path.join(REKAP_DIR, LOG_FILENAME);

  try {
    const data = await fs.readFile(logPath, "utf8");
    return JSON.parse(data);
  } catch {
    return [];
  }
}

async function updateRekapLog(log: string[]) {
  const logPath = path.join(REKAP_DIR, LOG_FILENAME);
  await fs.writeFile(logPath, JSON.stringify(log, null, 2), "utf8");
}

export async function runRekapWorker() {
  try {
    await fs.mkdir(REKAP_DIR, { recursive: true });

    const rekapPath = path.join(REKAP_DIR, REKAP_FILENAME);
    const log = await getRekapLog();

    const files = await fs.readdir(DELIVERED_DIR);
    const newFiles = files.filter(file => !log.includes(file));

    const newOrders = [];

    for (const file of newFiles) {
      const filePath = path.join(DELIVERED_DIR, file);
      try {
        const content = await fs.readFile(filePath, "utf8");
        const order = JSON.parse(content);
        newOrders.push(order);
        log.push(file); // tandai sebagai sudah direkap
      } catch (err) {
        console.error(`[REKAP ERROR] Gagal membaca file ${file}:`, err);
      }
    }

    if (newOrders.length > 0) {
      // Gabungkan dengan isi sebelumnya (jika ada)
      let existing: any[] = [];

      try {
        const current = await fs.readFile(rekapPath, "utf8");
        existing = JSON.parse(current);
      } catch {}

      const combined = [...existing, ...newOrders];
      await fs.writeFile(rekapPath, JSON.stringify(combined, null, 2), "utf8");
      await updateRekapLog(log);

      console.log(`[REKAP] ${newOrders.length} file direkap`);
    } else {
      console.log("[REKAP] Tidak ada file baru untuk direkap");
    }
  } catch (err) {
    console.error("[REKAP WORKER ERROR]", err);
  }
}
