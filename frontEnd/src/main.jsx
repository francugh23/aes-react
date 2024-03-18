import React from 'react'
import ReactDOM from 'react-dom/client'
import './index.css'

import { RouterProvider, createBrowserRouter } from 'react-router-dom'

import Login from './pages/Login'
import Entry from './pages/Entry'
import Enrollment from './components/Enrollment'
import Dashboard from './components/Dashboard'
import PageNotFound from './pages/PageNotFound'
import Records from './components/Records/Records'

const router = createBrowserRouter([
  {
    path: "/",
    element: <Login />,
    // errorElement: <PageNotFound />,
  },
  {
    path: "/nemesis",
    element: <Entry />,
    // errorElement: <PageNotFound />,
    children: [
      {
        path: "/nemesis/dashboard",
        element: <Dashboard />,
        // errorElement: <PageNotFound />,
      },
      {
        path: "/nemesis/enrollment",
        element: <Enrollment />,
        // errorElement: <PageNotFound />,
      },
      {
        path: "/nemesis/student-records",
        element: <Records />,
        // errorElement: <PageNotFound />,
      }
    ]
  },
]);

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <RouterProvider router={router} />
  </React.StrictMode>,
)
