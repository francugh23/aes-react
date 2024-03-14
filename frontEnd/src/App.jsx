import React from 'react'
import { RouterProvider, createBrowserRouter } from 'react-router-dom'
import Dashboard from './pages/Dashboard';
import Login from './pages/Login';
import './index.css'
import Layout from './components/Layout';

const router = createBrowserRouter([
  {
    path: "/",
    element: <Login />,
  },
  {
    path: "/dashboard",
    element: <Dashboard />,
  },
]);

function App() {
  return (
    <>
      <RouterProvider router={router} />
    </>
  )
}

export default App