import express from 'express'
import mysql from 'mysql'
import cors from 'cors'

const app = express();
app.use(cors());

const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "nemesis"
})

function LoginAuth(user, pass) {
  app.get('/', (req, res) => {
    const sql = "SELECT username, password FROM users WHERE username = '" + {user} + "' AND password = '" + {pass} + "'";
    db.query(sql, (err, result) => {
      if (err) return res.json({Message: "Server error"});
      return res.json(result);
    })
  })
}

// app.get('/', (req, res) => {
//   const sql = "SELECT username, password FROM users WHERE username = 'oko' AND password = 'oko'";
//   db.query(sql, (err, result) => {
//     if (err) return res.json({Message: "Server error"});
//     return res.json(result);
//   })
// })

app.listen(8081, ()=> {
  console.log("Listening")
})