import express from 'express'
import { getUsers } from './server.js'

const app = express()
app.use(express.json())

// Error Handling
app.use((err, req, res, next) => {
  console.error(err.stack)
  res.status(500).send('Something broke!')
})

// Listener
app.listen(3000, () => {
  console.log('Server is running on port 3000')
})

// Displaying all users from users table
app.get("/users", async (req, res) => {
  const users = await getUsers()
  res.send(users)
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