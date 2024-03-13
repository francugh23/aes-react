import Topbar from "../components/Topbar";
import Sidebar from "../components/Sidebar";
import Content from "../components/Dashboard/Content";

const Dashboard = () => {

  const style = {
    minHeight: '100vh',
  }

  return (
    <div style={style} className="bg-danger">
      <Topbar />
      <div className="row" style={style}>
        <div className="col-2 p-0">
          <Sidebar />
        </div>
        <div className="col p-0">
          <Content />
        </div>
      </div>
    </div>
  );
}

export default Dashboard