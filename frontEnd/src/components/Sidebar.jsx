import { Link } from "react-router-dom"
import EnrollmentBtn from "./Dashboard/EnrollmentBtn"
const Sidebar = () => {

  const style = {
    textSize: '13px',
    width: '90%',
  }

  const width = {
    width: '105px'
  }

  return (
    <>
      <nav style={width} className="d-flex flex-column bg-white align-items-center h-100 w-100 px-3 border-end">
        <Link rel="stylesheet" to="/dashboard" className="btn btn-success my-3" style={style}>
          Dashboard
        </Link>
        <hr />
        <div className="d-flex flex-column justify-content-center" style={style}>
          <EnrollmentBtn />
        </div>
      </nav>
    </>
  )
}

export default Sidebar