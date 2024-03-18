import { useState, useEffect } from "react";
import Axios from "axios";

const GenderTypeSelect = () => {
  // Gender
  const [gender, setGender] = useState([]);
  useEffect(() => {
    Axios.get("http://localhost:8081/gender")
      .then(res => {
        console.log(res)
        setGender(res.data)
      }).catch(err => {
        console.log(err)
      })
  }, [])

  return (
    <>
      <select name="genderSelect" id="genderSelect" className="form-select fs-6 alert border shadow-sm">
        <option disabled>Gender</option>
        {gender.map((data, index) => {
          return <option key={index} value={data.code}>{data.description}</option>
        })}
      </select>
    </>
  )
}

export default GenderTypeSelect