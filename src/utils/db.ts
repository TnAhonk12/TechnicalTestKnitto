import { db } from "../db/mysql";
export const getConnection = async () => await db.getConnection();