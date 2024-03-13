import "../index.css";
import Logo from "../assets/school-logo.png";
const Login = () => {
  const width = 250;

  return (
    <>
      <div className="bg-dark container-fluid" id="login-container">
        <div className="row">
          <div className="col-4 bg-light">
            <div className="d-flex flex-column justify-content-center align-items-center">
              <img src={Logo} alt="school-logo" width={width} />

              <div class="form-floating mb-3 shadow-sm w-75">
                <input
                  type="text"
                  class="form-control form-control-sm"
                  id="floatingInput"
                  placeholder="00-00000"
                />
                <label for="floatingInput">ID</label>
              </div>

              <div class="form-floating mb-3 shadow-sm w-75">
                <input
                  type="password"
                  class="form-control form-control-sm"
                  id="floatingInput"
                  placeholder="*******"
                />
                <label for="floatingInput">Password</label>
              </div>
            </div>
          </div>
          <div className="col bg-success opacity-75"></div>
        </div>
      </div>
    </>
  );
};

export default Login;
