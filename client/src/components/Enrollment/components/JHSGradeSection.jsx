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

  // For Sending Request Section by Year
  function getSection() {
    useEffect(() => {
      axios
        .post("http://localhost:3000/get-sections", {
          year: year
        })
        .then(res => {
          section(res.data)
          console.log(yearSection)
        })
        .catch(err => {
          console.log(err)
        })
    }, [])
  }

  return(
    <>
      <div className="col">
          <select name="gradeSelect" id="gradeSelect" className="form-select alert border shadow-sm">
            {year.map((data, key) => {
              return <option key={key} value={data.id}>Grade {data.year}</option>
            })}
          </select>
        </div>
        <div className="col">
          <select name="sectionSelect" id="sectionSelect" className="form-select alert border shadow-sm">
            <option selected={true} disabled='disabled'>Section</option>
          </select>
        </div>
    </>
  )
}

export default JHSGradeSection