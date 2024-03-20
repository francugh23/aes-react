import FloatingInput from "../UI/FloatingInput";
import StudentTypeSelect from "./components/StudentTypeSelect"
import GenderTypeSelect from "./components/GenderTypeSelect";
import { useRef } from "react";
import JHSGradeSection from "./components/JHSGradeSection";

const LearnerInformation = () => {
  const selectedType = useRef();

  function SetStudentType(e) {
    selectedType.current = e.target.value
    let jhs = document.querySelectorAll('#jhs-yrlevel')
    let shs = document.querySelectorAll('#shs-yrlevel')
    if(selectedType.current === 'JHS') {
      jhs.forEach(e => {
        e.style.display = 'block'
      });
      shs.forEach(e => {
        e.style.display = 'none'
      });
    }
    if(selectedType.current === 'SHS') {
      shs.forEach(e => {
        e.style.display = 'block'
      });
      jhs.forEach(e => {
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
        {/* Col Grade Section */}
        <div className="col row py-2" id="jhs-yrLevel">
          <JHSGradeSection />
        </div>
      </div>
    </>
  )
}
export default LearnerInformation