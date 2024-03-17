import EnrollmentTypeSelect from "./EnrollmentTypeSelect"
const EnrollmentHeader = () => {
  return (
    <>
      <div className="row">
        <div className="col">
          <h2 className="">Enrollment Form</h2>
        </div>
        <div className="col-2">
          <EnrollmentTypeSelect />
        </div>
      </div>
    </>
  )
}

export default EnrollmentHeader