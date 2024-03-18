import express from 'express'
import mysql from 'mysql'
import cors from 'cors'

const app = express();
app.use(express.json())
app.use(cors());

// Listener
app.listen(8081, ()=> {
  console.log("Listening")
})

// Connection String
const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "nemesis",
})

// Connection checker
db.connect(function(error) {
  if(error) {
    console.log("Error : " + error.message);
  } else {
    console.log("Connected");
    // Send a success in frontEnd

  }
})

// Login Auth
app.post('/login', (req, res) => {
  const sql = "SELECT * FROM users WHERE username = ? AND password = ?"

  db.query(sql, [req.body.username, req.body.password], (err, data) => {
    if(err) return res.json('Error');
    if(data.length > 0) {
      return res.json(data);
    } else {
      return res.json('Failed');
    }
  })
})

// Get Student Type
app.get('/student-type', (req, res) => {
  const sql = "SELECT * FROM student_type";
  db.query(sql, (err, result) => {
    if (err) return res.json({Message: "Server error"});
    return res.json(result);
  })
})

// Get Student Gender
app.get('/gender', (req, res) => {
  const sql = "SELECT * FROM gender";
  db.query(sql, (err, result) => {
    if (err) return res.json({Message: "Server error"});
    return res.json(result);
  })
})

// // Insert Student Data
// app.post('/insert-student-data', (req, res) => {
//   const sql = "
//         Query1;
//         Query2;
//   ";

//   db.query(sql, [req.])
// })

// Fetch Student Data
app.get('/fetch-student-data', (req, res) => {
  const sql = "SELECT *, DATE(birthdate) as bdate FROM students";

  db.query(sql, (err, data) => {
    if (err) return res.json("Server Error");
    return res.json(data)
  });
})