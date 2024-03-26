import express from 'express'
import { loginAuth, studentTypeSelect, getYear, getSections, getGender } from './server.js'
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
  const { adminID, password } = req.body
  try {
    const loginResult = await loginAuth(adminID, password)
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

// Student Type Oko
app.get("/student-type", async (req, res) => {
  const studentTypeResult = await studentTypeSelect()
  if (studentTypeResult.length > 0) {
    res.json(studentTypeResult)
  }
})


// Year Oko
app.get("/get-year", async (req, res) => {
  const data = await getYear()
  if (data.length > 0) {
    res.json(data)
  }
})

// Sections Oko
app.get("/get-sections", async (req, res) => {
  const selectedYear = req.body;
  const data = await getSections(selectedYear)
  if (data.length > 0) {
    res.json(data)
  }
})

// Gender Yohan
app.get("/get-gender", async (req, res) => {
  const data = await getGender()
  if (data.length > 0) {
    res.json(data)
  }
})

// // Gender Yohan plus github copilot
// app.get("/get-gender", async (req, res) => {
//   try {
//     const enumValues = await getGender()
//     res.render('GenderTypeSelect.jsx', { enumValues })
//   } catch (error) {
//   }
// })