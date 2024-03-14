import { Link } from "react-router-dom"
import EnrollmentBtn from "./Dashboard/EnrollmentBtn"
const Sidebar = () => {

  const style = {
    width: '255px',
  }

  return (
    <>
      <nav className="bg-white align-items-center h-100 px-3" style={style}>
        <div className="container">
          <Link rel="stylesheet" to="/dashboard" className="btn btn-success my-3">
            Dashboard
          </Link>
          <hr />
          <div className="d-flex flex-column justify-content-center" style={style}>
            <EnrollmentBtn />
          </div>
        </div>
      </nav>
    </>
  )
}

export default Sidebar