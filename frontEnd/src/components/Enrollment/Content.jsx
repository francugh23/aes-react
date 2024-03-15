import { useEffect, useState } from "react"
import Input from "../UI/FloatingInput"
import Axios from "axios"
import FloatingInput from "../UI/FloatingInput";
const Content = () => {
  // Student Type
  const [studType, setStudType] = useState([]);
  useEffect(() => {
    Axios.get("http://localhost:8081/student-type")
    .then(res => {
      console.log(res)
      setStudType(res.data)
    }).catch(err => {
      console.log(err)
    })
  }, [])

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
      <div className="content p-2">
        <div className="card m-4 border-0">
          <div className="card-body">

            <div className="row">
              <div className="col">
                <h2 className="">Enrollment Form</h2>
              </div>
              <div className="col-2">
                <Select  />
              </div>
            </div>

            <div className="row">
              <div className="col-2 py-2">
                <Input idName='idNumber' placeholder='ID Number' type='text' />
              </div>
              <div className="col-2 py-2">
                <select name="studentTypeSelect" id="studentTypeSelect" className="form-select fs-6 alert border shadow-sm">
                  <option selected disabled>Student Type</option>
                  {studType.map((data, index) => {
                    return <option key={index} value={data.code}>{data.description}</option>
                  })}
                </select>
              </div>
              <div className="col py-2">
                <Input idName='lastName' placeholder='Last Name' type='text' />
              </div>
              <div className="col py-2">
                <Input idName='firstName' placeholder='First Name' type='text' />
              </div>
              <div className="col py-2">
                <Input idName='middleName' placeholder='Middle Name' type='text' />
              </div>
            </div>

            <div className="row">
              <div className="col-2 py-2">
                <select name="genderSelect" id="genderSelect" className="form-select fs-6 alert border shadow-sm">
                  <option selected disabled>Gender</option>
                  {gender.map((data, index) => {
                    return <option key={index} value={data.code}>{data.description}</option>
                  })}
                </select>
              </div>
              <div className="col-2 py-2">
                <FloatingInput type='date' placeholder='Birthday' idName='bdate' />
              </div>
              <div className="col-3 py-2">
                <Input idName='lrnInput' placeholder="Learner's Number Reference (LRN)" type='text' />
              </div>
              <div className="col py-2">
                <Input idName='middleName' placeholder='Middle Name' type='text' />
              </div>
              <div className="col py-2">
                <Input idName='lastName' placeholder='Last Name' type='text' />
              </div>
            </div>
          </div>
        </div>
      </div>
    </>
  )
}


function Select({}) {
  return (<select name="studentTypeSelect" id="studentTypeSelect" className="form-select alert border fs-6 mb-3 shadow-sm">
              <option value="new">New</option>
              <option value="old" disabled>Old</option>
              <option value="trans" disabled>Transferee</option>
            </select>);
}

export default Content