import "../index.css";
import Logo from "../assets/school-logo.png";
import FloatingInput from "../components/Generic/FloatingInput";
import SubmitButton from "../components/Generic/BSButton";
const Login = () => {
  const width = 250;

  return (
    <>
      <div className="bg-dark container-fluid" id="login-container">
        <div className="row">
          <div className="col-4 bg-light">
            <form action="" method="post"  className="d-flex flex-column justify-content-center align-items-center h-100">
              <img src={Logo} alt="school-logo" width={width}  className="mb-5"/>
              <FloatingInput type='text' idName='userID' placeholder='ID' />
              <FloatingInput type='password' idName='userPass' placeholder='Password' />
              <SubmitButton type='submit' value='Login' class='btn btn-lg btn-success w-75' />
            </form>
          </div>
          <div className="col bg-success opacity-75"></div>
        </div>
      </div>
    </>
  );
};

export default Login;
