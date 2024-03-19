// Functions and processes nalang siguro dito lahat.

// Express was already imported in app.js
// import express from 'express'
// import cors from 'cors'

import mysql from 'mysql2'

// const app = express();
// app.use(express.json())
// app.use(cors());

// Listener, i transfered this to app.js
// app.listen(8081, ()=> {
//   console.log("Listening")
// })

// Connection String by Darlito
// const db = mysql.createPool({
//   host: "localhost",
//   user: "root",
//   password: "",
//   database: "nemesis",
// }).promise()

// Connection by Yohan
const db = mysql.createPool({
  // host: process.env.MYSQL_HOST,
  // host: process.env.MYSQL_USERNAME,
  // host: process.env.MYSQL_PASSWORD,
  // host: process.env.MYSQL_DATABASE
    host: "localhost",
    user: "root",
    password: "",
    database: "nemesis"
}).promise()

// Try lang ito kung gagana, try mo muna sa thunderbird client
// Displaying all users
export async function getUsers() {
  const [rows] = await db.query("SELECT * FROM users")
  return rows
}

export async function loginAuth(username, password) {
  try {
    const [rows] = await db.query("SELECT * FROM users WHERE username = ? AND password = ?", [username, password]);
    return rows;
  } catch (error) {
    console.error("Login authentication error:", error);
    throw error; // Propagate error to caller
  }
}

export async function genderSelect() {
  try {
    const [rows] = await db.query("SELECT * FROM gender");
    return rows;
  } catch (error) {
    throw error; // Propagate error to caller
  }
}

export async function studentTypeSelect() {
  try {
    const [rows] = await db.query("SELECT * FROM student_type");
    return rows;
  } catch (error) {
    throw error; // Propagate error to caller
  }
}

// Connection checker, also transferred to app.js
// db.connect(function(error) {
//   if(error) {
//     console.log("Error : " + error.message);
//   } else {
//     console.log("Connected");
//     // Send a success in frontEnd

//   }
// })

// // Get Student Type
// app.get('/student-type', (req, res) => {
//   const sql = "SELECT * FROM student_type";
//   db.query(sql, (err, result) => {
//     if (err) return res.json({Message: "Server error"});
//     return res.json(result);
//   })
// })

// // Get Student Gender
// app.get('/gender', (req, res) => {
//   const sql = "SELECT * FROM gender";
//   db.query(sql, (err, result) => {
//     if (err) return res.json({Message: "Server error"});
//     return res.json(result);
//   })
// })


// // Fetch Student Data
// app.get('/fetch-student-data', (req, res) => {
//   const sql = "SELECT *, DATE(birthdate) as bdate FROM students";

//   db.query(sql, (err, data) => {
//     if (err) return res.json("Server Error");
//     return res.json(data)
//   });
// })