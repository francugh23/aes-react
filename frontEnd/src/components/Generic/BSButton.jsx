const BSButton = (props) => {
  return (
    <button type={props.type} class={props.class}>{props.value}</button>
  )
}

export default BSButton