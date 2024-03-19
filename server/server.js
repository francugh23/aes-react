import mysql from 'mysql2'

const db = mysql.createPool({
    host: "localhost",
    user: "root",
    password: "",
    database: "nemesis"
}).promise()

// Displaying all users
export async function getUsers() {
  const [rows] = await db.query("SELECT * FROM users")
  return rows
}

export async function loginAuth(username, password) {
  try {
    const [rows] = await db.query("SELECT * FROM users WHERE username = ? AND password = ?", [username, password])
    return rows
  } catch (error) {
    console.error("Login authentication error:", error)
    throw error
  }
}

export async function genderSelect() {
  try {
    const [rows] = await db.query("SELECT * FROM gender")
    return rows
  } catch (error) {
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

// // Fetch Student Data
// app.get('/fetch-student-data', (req, res) => {
//   const sql = "SELECT *, DATE(birthdate) as bdate FROM students";

//   db.query(sql, (err, data) => {
//     if (err) return res.json("Server Error");
//     return res.json(data)
//   });
// })