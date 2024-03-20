import LinkButton from "../components/UI/LinkButton"
const PageNotFound = () => {

  return(
    <>
      <div style={{minHeight: '100vh'}} className="w-100 d-flex flex-column justify-content-center align-items-center">
        <h1 className="my-2">Page Not Found <span className="h1">&#9785;</span></h1>
        <LinkButton to='/nemesis/dashboard' class='btn btn-primary' text='Back to home' />
      </div>
    </>
  )
}

export default PageNotFound