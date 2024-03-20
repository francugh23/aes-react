import { useState, useEffect } from "react";
import Axios from "axios";

const GenderTypeSelect = () => {
  // Gender
  const [gender, setGender] = useState([]);
  useEffect(() => {
    Axios.get("http://localhost:3000/gender-options")
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
        {gender.map((data, index) => {
          return <option key={index} value={data.code}>{data.description}</option>
        })}
      </select>
    </>
  )
}

export default GenderTypeSelect