import Content from "../components/Dashboard/Content"
import Sidebar from "../components/Sidebar"
import Topbar from "../components/Topbar"

<<<<<<< HEAD
import React, { useState, useEffect, useRef } from "react";

const Dashboard = () => {
  // CSS
  const style = {
    minHeight: '100vh',
  }

  const [topnavHeight, setTopnavHeight] = useState(0);
  const [sidenavWidth, setSidenavWidth] = useState(0);

  const topnavRef = useRef();
  const sidenavRef = useRef();

  useEffect(() => {
    const updateDimension = () => {
      setTopnavHeight(topnavRef.current ? topnavRef.current.offsetHeight : 0);
      setSidenavWidth(sidenavRef.current ? sidenavRef.current.offSetWidth : 0);
    };
    updateDimension();
    window.addEventListener('resize', updateDimension);
  }, []);

  console.log(topnavHeight);
  console.log(sidenavWidth);

  return (
    <div style={{display: 'flex'}}>
      <div ref={topnavRef} className="topnav">
        <Topbar />
      </div>
      <div ref={sidenavRef} className="sidenav">
        <Sidebar />
      </div>
      <div
        className="content"
        style={{ marginTop: topnavHeight + 'px', marginLeft: sidenavWidth + 'px' }}
      >
        <Content />
      </div>
  </div>
  );
=======
const Dashboard = () => {
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
>>>>>>> a34300256a11854a8964b4553023c813cff9ad33
}

export default Dashboard