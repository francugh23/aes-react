import BSButton from "../UI/BSButton"
import AddressContact from "./AddressContact"
import LearnerInformation from "./LearnerInformation"
import EnrollmentHeader from "./components/EnrollmentHeader"
const Enrollment = () => {
  return (
    <div id="wrapper">
      <div className="content p-2">
        <div className="card m-4 border-0">
          <div className="card-body">
            <EnrollmentHeader />
            <LearnerInformation />
            <AddressContact />
          </div>
          <div className="card-footer">
            <BSButton type='submit' class='btn btn-primary me-2' value='Submit' />
            <BSButton type='button' class='btn btn-danger me-2' value='Clear' />
          </div>
        </div>
      </div>
    </div>
  )
}

export default Enrollment