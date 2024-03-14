const BSButton = (props) => {
  return (
    <input type={props.type} className={props.class} onClick={props.onClick} value={props.value} />
  )
}

export default BSButton