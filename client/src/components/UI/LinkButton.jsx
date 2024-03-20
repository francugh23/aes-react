import { Link } from "react-router-dom"
const LinkButton = (props) => {
  return (
    <>
      <Link to={props.to} className={props.class}>{props.text}</Link>
    </>
  )
}

export default LinkButton