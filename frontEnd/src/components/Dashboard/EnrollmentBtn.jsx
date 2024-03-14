const EnrollmentBtn = () => {
  return(
    <>
      <a className="btn btn-white border-0 text-start" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
        <span className="me-3"><i className="fas fa-caret-right"></i></span>Enrollment Form
      </a>
      <div className="collapse" id="collapseExample">
        <div className="d-flex flex-column ps-5">
          <a className="btn btn-white border-0 text-start">
            Old Student
          </a>
          <a className="btn btn-white border-0 text-start">
            New Student
          </a>
        </div>
      </div>
    </>
  )
}

export default EnrollmentBtn