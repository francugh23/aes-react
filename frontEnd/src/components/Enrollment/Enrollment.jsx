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
        </div>
      </div>
    </div>
  )
}

export default Enrollment