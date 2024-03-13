import Topbar from "../components/Topbar";
import Sidebar from "../components/Sidebar";
const Dashboard = () => {
  return (
    <>
      <div className="row-col">
        <Topbar />
      </div>
      <div className="row">
        <div className="col-2 bg-dark">
          <Sidebar />
        </div>
        <div className="col">

        </div>
      </div>
    </>
  );
}

export default Dashboard