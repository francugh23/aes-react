import express from 'express'
import { genderSelect, getUsers, loginAuth, studentTypeSelect } from './server.js'
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
  const { username, password } = req.body
  try {
    const loginResult = await loginAuth(username, password)
    if (loginResult.length > 0) {
      res.json(loginResult)
    } else {
      res.status(401).json({ message: "Invalid username or password" })
    }
  } catch (error) {
    console.error("Login error:", error);
    res.status(500).json({ message: "Internal server error" })
  }
})

// Gender Options Oko
app.get("/gender-options", async (req, res) => {
  const genderResult = await genderSelect()
  if (genderResult.length > 0) {
    res.json(genderResult)
  }
});

// Student Type Oko
app.get("/student-type", async (req, res) => {
  const studentTypeResult = await studentTypeSelect()
  if (studentTypeResult.length > 0) {
    res.json(studentTypeResult)
  }
})

// Connection Checker
// db.connect(function(error) {
//   if(error) {
//     console.log("Error : " + error.message);
//   } else {
//     console.log("Connected");
//     // Send a success in frontEnd

//   }
// })