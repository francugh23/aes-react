import { useState, useEffect } from "react"
import Axios from "axios";

const StudentTypeSelect = (props) => {

  // Student Type
  const [studTypeSelect, setStudTypeSelect] = useState([]);
  useEffect(() => {
    Axios.get("http://localhost:8081/student-type")
      .then(res => {
        console.log('Student Type Select : ' + res.status)
        setStudTypeSelect(res.data)
      }).catch(err => {
        console.log('Student Type Select : ' + err.status)
      })
  }, [])

  return (
    <>
      <select name="studentTypeSelect" id="studentTypeSelect" 
        className="form-select fs-6 alert border shadow-sm"
        onChange={props.onChange}
        >
          <option selected={true} disabled>Student Type</option>
        {studTypeSelect.map((data, index) => {
          return <option key={index} value={data.code}>{data.description}</option>
        })}
      </select>
    </>
  )
}

export default StudentTypeSelect