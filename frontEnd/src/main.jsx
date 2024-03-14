import React from 'react'
import ReactDOM from 'react-dom/client'
import { RouterProvider, createBrowserRouter } from 'react-router-dom'
import Login from './pages/Login'
import './index.css'
import Enrollment from './pages/Enrollment'
import Dashboard from './pages/Dashboard'
import Entry from './pages/Entry'

const router = createBrowserRouter([
  {
    path: "/",
    element: <Login />,
  },
  {
    path: "/nemesis",
    element: <Entry />,
    children: [
      {
        path: "/nemesis/dashboard",
        element: <Dashboard />
      },
      {
        path: "/nemesis/enrollment",
        element: <Enrollment />
      }
    ]
  },
]);

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <RouterProvider router={router} />
  </React.StrictMode>,
)
