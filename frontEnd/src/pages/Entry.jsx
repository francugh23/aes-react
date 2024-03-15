import { Outlet } from "react-router-dom"
import Sidebar from "../components/Navigation/Sidebar/Sidebar"
import Topbar from "../components/Navigation/Topbar/Topbar"

const Entry = () => {
  return (
    <>
      <Sidebar />
      <Topbar />
      <Outlet marginTop='69px' marginLeft='255px' width='100%' />
    </>
  )
}

export default Entry