import Input from "../UI/FloatingInput"
const Content = () => {

  return (
    <>
      <div className="content p-2">
        <div className="card">
          <div className="card-body">
            <div className="row">
              <div className="col text-center">
                <Input idName='firstName' placeholder='First Name' type='text' />
              </div>
              <div className="col text-center">
                <Input idName='middleName' placeholder='Middle Name' type='text' />
              </div>
              <div className="col text-center">
                <Input idName='lastName' placeholder='Last Name' type='text' />
              </div>
              <div className="col text-center">
                <Input idName='idNumber' placeholder='ID Number' type='text' />
              </div>
            </div>
          </div>
        </div>
      </div>
    </>
  )
}

export default Content