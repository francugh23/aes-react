
const FloatingInput = (props) => {
  return (
    <div className="form-floating mb-3 shadow-sm w-75">
      <input
        type={props.type}
        className="form-control form-control-sm"
        id={props.idName}
        name={props.idName}
        placeholder={props.placeholder}
        onChange={props.onChange}
      />
      <label htmlFor="floatingInput">{props.placeholder}</label>
    </div>
  )
}

export default FloatingInput