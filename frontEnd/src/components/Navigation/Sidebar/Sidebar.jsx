import { Link } from "react-router-dom"
const Sidebar = () => {

  return (
    <>
      <nav className="bg-white align-items-center border-end position-fixed h-100" style={{width: '255px', marginTop: '69px'}}>
        <div className="container px-3 m-0">
          <Link rel="stylesheet" to="/nemesis/dashboard" className="btn btn-success mt-3 w-100">
            Dashboard
          </Link>
          <hr />
          <p className="fw-bold text-secondary">Navigation</p>
          <div className="d-flex flex-column justify-content-center">
            <a href="/nemesis/enrollment" className="btn btn-primary">
              <span className="me-3"><i class="fas fa-user-plus"></i></span>
              Enrollment Form
            </a>
          </div>
        </div>
      </nav>
    </>
  )
}

export default Sidebar