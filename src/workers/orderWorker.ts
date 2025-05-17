import fs from "fs/promises";
import path from "path";

const CUSTOMER_ORDER_DIR = path.join(__dirname, "../database/customer-order");
const DELIVERED_ORDER_DIR = path.join(__dirname, "../database/delivered-order");

async function processFile(fileName: string, attempt = 1): Promise<void> {
  const sourcePath = path.join(CUSTOMER_ORDER_DIR, fileName);
  const destPath = path.join(DELIVERED_ORDER_DIR, fileName);

  try {
    const fileData = await fs.readFile(sourcePath, "utf8");
    const order = JSON.parse(fileData);

    order.status = "Dikirim ke customer";

    const isExists = await fs
      .access(destPath)
      .then(() => true)
      .catch(() => false);

    if (isExists) {
      console.log(`[SKIP] File sudah ada di delivered: ${fileName}`);
      return;
    }

    // Simpan ke folder delivered
    await fs.writeFile(destPath, JSON.stringify(order, null, 2), "utf8");

    console.log(`[OK] File ${fileName} diproses & dikirim`);
  } catch (error) {
    if (attempt < 3) {
      console.warn(`[RETRY] Gagal memproses ${fileName}, percobaan ke-${attempt + 1}`);
      return processFile(fileName, attempt + 1);
    } else {
      console.error(`[FAIL] Gagal permanen memproses ${fileName}: ${error}`);
    }
  }
}

export async function runOrderWorker() {
  try {
    const files = await fs.readdir(CUSTOMER_ORDER_DIR);

    // Ambil maksimal 10 file
    const toProcess = files.slice(0, 10);

    await Promise.allSettled(toProcess.map(file => processFile(file)));
  } catch (err) {
    console.error("[WORKER ERROR]", err);
  }
}
