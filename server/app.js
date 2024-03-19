import express from 'express'

const app = express()

app.use(express.json())

// Error Handling
app.use((err, req, res, next) => {
  console.error(err.stack)
  res.status(500).send('Something broke!')
})

// Listener
app.listen(8080, () => {
  console.log('Server is running on port 8080')
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