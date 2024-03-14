import "../index.css";
import Logo from "../assets/school-logo.png";
import FloatingInput from "../components/Generic/FloatingInput";
import Button from "../components/Generic/BSButton";
import { useEffect, useState } from "react";
import { Link, RouterProvider, Navigate } from "react-router-dom";
import Axios from "axios";
import md5 from "md5";


const Login = () => {
  // Custom CSS
  const width = 190
  const fontSize = {
    fontSize: '50px'
  };

  // For Auth API
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");

  const login = () => {
    Axios.post("http://localhost:8081/login", {
      username: username,
      password: md5(password),
    }).then((response) => {
      console.log(response);
      if(response.data == 'Success') {
        location.href = '/dashboard'
      } else if (response.data == 'Failed') {
        alert('Invalid Username / Password');
      }
    })
  }

  return (
    <>
      <div className="bg-dark container-fluid" id="login-container">
        <div className="row">
          <div className="col-4 bg-light">
            <div className="d-flex flex-column justify-content-center align-items-center h-100">
              <img src={Logo} alt="school-logo" width={width}  className="mb-5"/>
              <FloatingInput type='text' idName='username' placeholder='ID' onChange={
                (e) => {
                  setUsername(e.target.value);
                }
              }/>
              <FloatingInput type='password' idName='userPass' placeholder='Password' onChange={
                (e) => {
                  setPassword(e.target.value);
                }
              } />
              <Button type='button' value='Login' class='btn btn-lg btn-success w-75' onClick={login} />
            </div>
          </div>
          <div className="col p-0 position-relative">
            <div className="position-absolute z-3 top-50 start-50 translate-middle">
              <p className="text-light">
                <span style={fontSize}>NEMESIS</span> 
                <br /> is blah blah blah ......</p>
            </div>
            <div className="bg-success h-100 opacity-75"></div>
          </div>
        </div>
      </div>
    </>
  );
};

export default Login;
