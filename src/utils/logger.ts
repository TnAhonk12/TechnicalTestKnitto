import fs from "fs/promises";
import path from "path";

export async function saveOrderToFile(order: any, fileName: string, retries = 3): Promise<void> {
  const dir = path.join(__dirname, "../database/customer-order");
  await fs.mkdir(dir, { recursive: true });
  const filePath = path.join(dir, `${fileName}.json`);
  
  try {
    await fs.writeFile(filePath, JSON.stringify(order, null, 2));
  } catch (error) {
    if (retries > 0) {
      return saveOrderToFile(order, fileName, retries - 1);
    } else {
      throw error;
    }
  }
}