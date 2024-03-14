import { Link } from "react-router-dom"
import EnrollmentBtn from "./Dashboard/EnrollmentBtn"
const Sidebar = () => {

  return (
    <>
      <nav className="bg-white align-items-center border-end position-fixed h-100" style={{width: '255px'}}>
        <div className="container px-3 m-0">
          <Link rel="stylesheet" to="/dashboard" className="btn btn-success mt-3 w-100">
            Dashboard
          </Link>
          <hr />
          <p className="fw-bold text-secondary">Navigation</p>
          <div className="d-flex flex-column justify-content-center">
            <EnrollmentBtn />
          </div>
        </div>
      </nav>
    </>
  )
}

export default Sidebar