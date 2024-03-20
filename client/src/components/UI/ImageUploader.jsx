import Button from './BSButton'
const ImageUploader = (props) => {
  return (
    <>
      <div className="container h-100 justify-content-center align-items-center card card-body">
        <label htmlFor={props.idName} className='text-center my-2'>{props.label}</label>
        <label htmlFor={props.idName} className='text-center my-2 btn btn-primary'>Browse</label>
        <input type="file" name={props.idName} id={props.idName} hidden accept="image/x-png,image/jpeg" />
      </div>
    </>
  )
}

export default ImageUploader