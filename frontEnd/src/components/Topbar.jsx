import { useEffect } from 'react'
import logo from '../assets/school-logo.png'
const Topbar = () => {

  return (
<<<<<<< HEAD
    <>
      <nav className="navbar navbar-expand-lg bg-white p-2 border-bottom position-fixed end-0 start-0 z-3">
=======
    <div className="position-relative w-100 h-100">
      <nav className="navbar navbar-expand-lg bg-white p-2 border-bottom">
>>>>>>> a34300256a11854a8964b4553023c813cff9ad33
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