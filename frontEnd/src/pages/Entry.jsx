import { Outlet } from "react-router-dom"
import Sidebar from "../components/Sidebar"
import Topbar from "../components/Topbar"

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