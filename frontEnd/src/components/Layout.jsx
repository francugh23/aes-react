import Content from "./Dashboard/Content"
import Sidebar from "./Sidebar"
import Topbar from "./Topbar"

const Layout = () => {
  const height = {
    minHeight: '100vh'
  }
  return (
    <>
      <div className="container-fluid" style={height}>
        <div className="row">
          <div className="col p-0">
            <Topbar />
          </div>
        </div>
        <div className="row">
          <div className="col-2 p-0">
            <Sidebar />
          </div>
          <div className="col bg-info p-0">
            <Content />
          </div>
        </div>
      </div>
    </>
  )
}

export default Layout