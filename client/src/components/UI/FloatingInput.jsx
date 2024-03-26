
const FloatingInput = (props) => {
  return (
    <div className="form-floating shadow-sm rounded">
      <input
        type={props.type}
        className="form-control form-control-sm"
        id={props.idName}
        name={props.idName}
        placeholder={props.placeholder}
        onChange={props.onChange}
        required={true}
      />
      <label htmlFor="floatingInput">{props.placeholder}</label>
    </div>
  )
}

export default FloatingInput