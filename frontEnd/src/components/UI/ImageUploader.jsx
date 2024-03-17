import Button from './BSButton'
const ImageUploader = (props) => {
  return (
    <>
      <div className="container h-100 justify-content-center align-items-center card card-body">
        <label htmlFor={props.idName} className='text-center my-2'>{props.label}</label>
        <Button type='button' class='btn btn-primary w-25' idName='imgUploader' value='Browse' />
        <input type="file" name={props.idName} id={props.idName} hidden accept="img/*" />
      </div>
    </>
  )
}

export default ImageUploader