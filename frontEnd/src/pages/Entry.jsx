import { Outlet } from "react-router-dom"
import Sidebar from "../components/Navigation/Sidebar/Sidebar"
import Topbar from "../components/Navigation/Topbar/Topbar"

const Entry = () => {
  return (
    <>
      <Sidebar />
      <Topbar />
      <Outlet marginTop='69px' marginLeft='255px' />
    </>
  )
}

export default Entry