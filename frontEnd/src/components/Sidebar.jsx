import { Link } from "react-router-dom"
import EnrollmentBtn from "./Dashboard/EnrollmentBtn"
const Sidebar = () => {

  const style = {
    width: '255px',
  }

  const width = {
    width: '105px'
  }

  return (
    <>
<<<<<<< HEAD
      <nav className="bg-white align-items-center h-100 px-3" style={style}>
        <div className="container">
          <Link rel="stylesheet" to="/dashboard" className="btn btn-success my-3">
            Dashboard
          </Link>
          <hr />
          <div className="d-flex flex-column justify-content-center" style={style}>
            <EnrollmentBtn />
          </div>
=======
      <nav style={width} className="d-flex flex-column bg-white align-items-center h-100 w-100 px-3 border-end">
        <Link rel="stylesheet" to="/dashboard" className="btn btn-success my-3" style={style}>
          Dashboard
        </Link>
        <hr />
        <div className="d-flex flex-column justify-content-center" style={style}>
          <EnrollmentBtn />
>>>>>>> a34300256a11854a8964b4553023c813cff9ad33
        </div>
      </nav>
    </>
  )
}

export default Sidebar