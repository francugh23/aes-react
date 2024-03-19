import express from 'express'
import { getUsers, loginAuth } from './server.js'
import cors from 'cors'

const app = express()
app.use(express.json())
app.use(cors())

// Error Handling
app.use((err, req, res, next) => {
  console.error(err.stack)
  res.status(500).send('Something broke!')
})

// Listener
app.listen(3000, () => {
  console.log('Server is running on port 3000')
})

// Login Auth Yohan
app.post("/login", async (req, res) => {
  const { username, password } = req.body;
  try {
    const loginResult = await loginAuth(username, password);
    if (loginResult.length > 0) {
      res.json(loginResult);
    } else {
      res.status(401).json({ message: "Invalid username or password" });
    }
  } catch (error) {
    console.error("Login error:", error);
    res.status(500).json({ message: "Internal server error" });
  }
});

// Displaying all users from users table
app.get("/users", async (req, res) => {
  const users = await getUsers()
  res.send(users)
})

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

// Login Auth
// app.post('/login', (req, res) => {
//   const sql = "SELECT * FROM users WHERE username = ? AND password = ?"

//   db.query(sql, [req.body.username, req.body.password], (err, data) => {
//     if (err) return res.json('Error');
//     if (data.length > 0) {
//       return res.json(data);
//     } else {
//       return res.json('Failed');
//     }
//   })
// })

// Connection Checker
// db.connect(function(error) {
//   if(error) {
//     console.log("Error : " + error.message);
//   } else {
//     console.log("Connected");
//     // Send a success in frontEnd

//   }
// })