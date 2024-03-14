import Topbar from "../components/Topbar";
import Sidebar from "../components/Sidebar";
import Content from "../components/Dashboard/Content";

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
}

export default Dashboard