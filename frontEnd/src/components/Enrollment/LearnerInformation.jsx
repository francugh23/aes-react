import FloatingInput from "../UI/FloatingInput";
import StudentTypeSelect from "./components/StudentTypeSelect";
import GenderTypeSelect from "./components/GenderTypeSelect";
import { useState } from "react";

const LearnerInformation = () => {
  const [selectedType, setSelectedType] = useState('');

  const SetStudentType = (e) => {
    let val = e.target.value
    let jhs = document.querySelectorAll('#jhs-yrlevel')
    let shs = document.querySelectorAll('#shs-yrlevel')
    setSelectedType(val)
    if(selectedType === 'JHS') {
      shs.forEach(e => {
        e.style.display = 'block'
      });
      jhs.forEach(e => {
        e.style.display = 'none'
      });
    }
    if(selectedType === 'SHS') {
      jhs.forEach(e => {
        e.style.display = 'block'
      });
      shs.forEach(e => {
        e.style.display = 'none'
      });
    }
  }

  return (
    <>
      <h5>Learner's Information</h5>
      <hr />
      <div className="row">
        <div className="col-2 py-2">
          <FloatingInput idName='idNumber' placeholder='ID Number' type='text' />
        </div>
        <div className="col-3 py-2">
          <StudentTypeSelect onChange={SetStudentType} />
        </div>
        <div className="col py-2">
          <FloatingInput idName='lastName' placeholder='Last Name' type='text' />
        </div>
        <div className="col py-2">
          <FloatingInput idName='firstName' placeholder='First Name' type='text' />
        </div>
        <div className="col py-2">
          <FloatingInput idName='middleName' placeholder='Middle Name' type='text' />
        </div>
      </div>
      
      <div className="row">
        <div className="col-2 py-2">
          <GenderTypeSelect />
        </div>
        <div className="col-2 py-2">
          <FloatingInput type='date' placeholder='Birthday' idName='bdate' />
        </div>
        <div className="col-3 py-2">
          <FloatingInput idName='lrnInput' placeholder="Learner's Number Reference (LRN)" type='text' />
        </div>
        <div className="col py-2">
          <select name="gradeSelect" id="jhs-yrlevel" className="form-select alert border shadow-sm">
            <option selected={true} disabled='disabled'>Grade</option>
          </select>
          <select name="strandSelect" id="shs-yrlevel" style={{ display: 'none' }} className="form-select alert border shadow-sm">
            <option selected={true} disabled='disabled'>Strand</option>
          </select>
        </div>
        <div className="col py-2">
          <select name="sectionSelect" id="jhs-yrlevel" className="form-select alert border shadow-sm">
            <option selected={true} disabled='disabled'>Section</option>
          </select>
          <select name="trackSelect" id="shs-yrlevel" style={{ display: 'none' }} className="form-select alert border shadow-sm">
            <option selected={true} disabled='disabled'>Track</option>
          </select>
        </div>
      </div>
    </>
  )
}
export default LearnerInformation