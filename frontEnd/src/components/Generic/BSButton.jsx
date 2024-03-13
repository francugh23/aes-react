const BSButton = (props) => {
  return (
    <button type={props.type} className={props.class} onClick={props.onClick} >{props.value}</button>
  )
}

export default BSButton