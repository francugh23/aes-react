import logo from '../assets/school-logo.png'
const Topbar = () => {

  return (
    <div className="position-relative w-100 h-100">
      <nav className="navbar navbar-expand-lg bg-white p-2 border-bottom">
        <div className="container-fluid px-5">
          <a className="navbar-brand" href="#">
            <img src={logo} alt="" width={40}/>
            <span className='h4 mx-3 my-auto'>NEMESIS</span>
          </a>

          <div>
            <img src="" alt="profile-icon" />
          </div>
        </div>
      </nav>
    </div>
  )
}

export default Topbar