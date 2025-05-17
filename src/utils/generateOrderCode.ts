export const generateOrderCode = (lastCode: string): string => {
    const lastNumber = parseInt(lastCode.split("-")[1] || "0");
    return `ORD-${String(lastNumber + 1).padStart(4, "0")}`;
  };

export const generateOrderCodeNew = (customerId: number): string => {
  const now = new Date();
  const datePart = `${String(now.getDate()).padStart(2, "0")}${String(now.getMonth() + 1).padStart(2, "0")}${String(now.getFullYear()).slice(2)}`;

  const timestamp = now.getTime().toString().slice(-5); // ambil 5 digit terakhir timestamp

  return `ORDER-${customerId}-${datePart}-${timestamp}`;
};


  