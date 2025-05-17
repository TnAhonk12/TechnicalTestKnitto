export const generateOrderCodeNew = (customerId: number, lastCode?: string): string => {
  const now = new Date();
  const datePart = `${String(now.getDate()).padStart(2, "0")}${String(now.getMonth() + 1).padStart(2, "0")}${String(now.getFullYear()).slice(2)}`;

  let running = "00001"; // default awal

  if (lastCode) {
    const parts = lastCode.split("-");
    const lastDatePart = parts[2];
    const lastNumber = parts[3];

    if (lastDatePart === datePart) {
      const incremented = parseInt(lastNumber) + 1;
      running = String(incremented).padStart(5, "0");
    }
  }

  return `ORDER-${customerId}-${datePart}-${running}`;
};
