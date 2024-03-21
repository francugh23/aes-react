import { useState, useEffect } from "react";
import axios from "axios";

const GenderTypeSelect = () => {
  // Gender
  const [gender, setGender] = useState([]);
  useEffect(() => {
    axios.get("http://localhost:3000/get-gender")
      .then(res => {
        console.log(res)
        setGender(res.data)
      }).catch(err => {
        console.log(err)
      })
  }, [])

  return (
    <>
      <select name="genderSelect" id="genderSelect" className="form-select fs-6 alert border shadow-sm" required={true}>
        <option disabled={true} selected={true}>Gender</option>
        {gender.map((value, index) => (
          <option key={index} value={value}>{value}</option>
        ))}
      </select>
    </>
  )
}

export default GenderTypeSelect