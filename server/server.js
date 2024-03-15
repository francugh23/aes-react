import express from 'express'
import mysql from 'mysql'
import cors from 'cors'

const app = express();
app.use(express.json())
app.use(cors());

const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "nemesis"
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
      return res.json('Success');
    } else {
      return res.json('Failed');
    }
  })
})

// app.get('/', (req, res) => {
//   const sql = "SELECT * FROM users";
//   db.query(sql, (err, result) => {
//     if (err) return res.json({Message: "Server error"});
//     return res.json(result);
//   })
// })

// Student Type
app.get('/student-type', (req, res) => {
  const sql = "SELECT * FROM student_type";
  db.query(sql, (err, result) => {
    if (err) return res.json({Message: "Server error"});
    return res.json(result);
  })
})

app.listen(8081, ()=> {
  console.log("Listening")
})