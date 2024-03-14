const EnrollmentBtn = () => {
  return(
    <>
      <a className="btn btn-white border-0 text-start" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
        <span className="me-3"><i className="fas fa-caret-right"></i></span>Enrollment Form
      </a>
      <div className="collapse" id="collapseExample">
        <div className="d-flex flex-column">
          <a className="btn btn-white border-0 text-center">
            Old Student
          </a>
          <a className="btn btn-white border-0 text-center">
            New Student
          </a>
        </div>
      </div>
    </>
  )
}

export default EnrollmentBtn