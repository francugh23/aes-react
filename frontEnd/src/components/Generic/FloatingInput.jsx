
const FloatingInput = (props) => {
  return (
    <div class="form-floating mb-3 shadow-sm w-75">
      <input
        type={props.type}
        class="form-control form-control-sm"
        id={props.idName}
        name={props.idName}
        placeholder={props.placeholder}
      />
      <label for="floatingInput">{props.placeholder}</label>
    </div>
  )
}

export default FloatingInput