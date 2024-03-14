import React from 'react'
import ReactDOM from 'react-dom/client'
import './index.css'

import { RouterProvider, createBrowserRouter } from 'react-router-dom'

import Login from './pages/Login'
import Entry from './pages/Entry'
import Enrollment from './components/Enrollment'
import Dashboard from './components/Dashboard'

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
