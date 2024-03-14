import logo from '../assets/school-logo.png'
const Topbar = (props) => {

  return (
    <>
      <nav className="navbar navbar-expand-lg bg-white p-2 border-bottom fixed-top" ref={props.topnavRef}>
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
    </>
  )
}

export default Topbar