import Content from "../components/Dashboard/Content"
import Sidebar from "../components/Sidebar"
import Topbar from "../components/Topbar"

import React, { useState, useEffect, useRef } from "react";

const Dashboard = () => {

  const [topnavHeight, setTopnavHeight] = useState(0);
  const [sidenavWidth, setSidenavWidth] = useState(0);

  const topnavRef = useRef();
  const sidenavRef = useRef();

  useEffect(() => {
    const updateDimension = () => {
      setTopnavHeight(topnavRef.current ? topnavRef.current.offsetHeight : 0);
      setSidenavWidth(sidenavRef.current ? sidenavRef.current.offsetWidth : 0);
    };
    updateDimension();
    window.addEventListener('resize', updateDimension);
  }, []);  

  return (
    <div>
        <Topbar />
        <Sidebar />
        <Content />
  </div>
  );
}

export default Dashboard