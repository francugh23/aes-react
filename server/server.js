import mysql from 'mysql2'

const db = mysql.createPool({
    host: "localhost",
    user: "root",
    password: "",
    database: "aes"
}).promise()

export async function loginAuth(adminID, password) {
  try {
    const [rows] = await db.query("SELECT * FROM users WHERE admin_id = ? AND password = ?", [adminID, password])
    return rows
  } catch (error) {
    console.error("Login authentication error:", error)
    throw error
  }
}

export async function studentTypeSelect() {
  try {
    const [rows] = await db.query("SELECT * FROM student_type")
    return rows
  } catch (error) {
    throw error
  }
}

export async function getYear() {
  try {
    const [rows] = await db.query("SELECT * FROM year_level");
    return rows
  } catch (error) {
    throw error
  }
}

export async function getSections(selectedYear) {
  try {
    const [rows] = await db.query("SELECT * FROM sections WHERE year_id = ?", [selectedYear]);
    return rows
  } catch (error) {
    throw error
  }
}

export async function getGender() {
  try {
    const [rows] = await db.query("SHOW COLUMNS FROM students LIKE 'gender'");
    const enumValues = rows[0].Type.match(/'([^']+)'/g).map(value => value.replace(/'/g, ''));
    return enumValues;
  } catch (error) {
    throw error;
  }
}