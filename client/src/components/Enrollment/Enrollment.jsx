import BSButton from "../UI/BSButton"
import AddressContact from "./AddressContact"
import LearnerInformation from "./LearnerInformation"
import EnrollmentHeader from "./components/EnrollmentHeader"
const Enrollment = () => {
  return (
    <div id="wrapper">
      <div className="content p-2">
        <div className="card m-4 rounded-0 border-0">
          <div className="card-header bg-white border-0">
            <EnrollmentHeader />
          </div>
          <div className="card-body shadow">
            <form action="">
              <LearnerInformation />
              <AddressContact />
              <BSButton type='submit' class='btn btn-primary ms-2' value='Submit' />
              <BSButton type='button' class='btn btn-danger ms-2' value='Clear' />
            </form>
          </div>
        </div>
      </div>
    </div>
  )
}

export default Enrollment