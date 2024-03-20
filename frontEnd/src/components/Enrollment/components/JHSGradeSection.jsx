import axios from "axios"
import { useEffect, useState } from "react"
const JHSGradeSection = () => {
  const [yearLevel, setYearLevel] = useState([]);
  const [section, setSection] = useState([]);

  useEffect(() => {
    axios
      .get("http://localhost:3000/student-year")
      .then(res => {
        setYearLevel(res.data)
      })
      .catch(err => {
        console.log(err)
      })
  }, [])
  return(
    <>
      <div className="col">
          <select name="gradeSelect" id="jhs-yrlevel" className="form-select alert border shadow-sm">
            <option selected={true} disabled='disabled'>Year Level</option>
            {yearLevel.map((data, index) => {
              return <option key={index} value={data.id}>{data.year}</option>
            })}
          </select>
        </div>
        <div className="col">
          <select name="sectionSelect" id="jhs-yrlevel" className="form-select alert border shadow-sm">
            <option selected={true} disabled='disabled'>Section</option>
          </select>
        </div>
    </>
  )
}

export default JHSGradeSection