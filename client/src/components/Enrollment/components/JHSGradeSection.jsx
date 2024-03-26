import axios from "axios"
import { useEffect, useState } from "react"
const JHSGradeSection = () => {
  const [year, setYear] = useState([]);
  const [section, setSection] = useState([]);

  // For Fetching Data For Sections
  useEffect(() => {
    axios
      .get("http://localhost:3000/get-year")
      .then(res => {
        setYear(res.data)
        console.log(yearSection)
      })
      .catch(err => {
        console.log(err)
      })
  }, [])

  return (
    <>
      <div className="col-5">
        <select name="gradeSelect" id="gradeSelect" className="form-select alert border shadow-sm">
          {year.map((data, key) => {
            return <option key={key} value={data.id}>{data.description}</option>
          })}
        </select>
      </div>
    </>
  )
}

export default JHSGradeSection