import { useState, useEffect, Component } from "react"
import axios from "axios";

const StudentTypeSelect = (props) => {

  // Student Type
  const [type, setType] = useState([]);
  
  // Fetch Data
  useEffect(() => {
    axios.get("http://localhost:3000/student-type")
      .then(res => {
        console.log('Student Type Select : ' + res.status)
        setType(res.data)
      }).catch(err => {
        console.log('Student Type Select : ' + err.status)
      })
  }, [])

  return (
    <>
      <select name="studentTypeSelect" id="studentTypeSelect" 
        className="form-select fs-6 alert border shadow-sm"
        onChangeCapture={props.onChange} >
        {type.map((data, index) => {
          return <option key={index} value={data.code}>{data.description}</option>
        })}
      </select>
    </>
  )
}

export default StudentTypeSelect