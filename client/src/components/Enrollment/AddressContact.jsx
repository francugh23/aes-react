import FloatingInput from "../UI/FloatingInput";

const AddressContact = () => {
  return (
    <>
      <h5>Address & Contact Info</h5>
      <hr />
      <div className="row">
        <div className="col-2 py-2">
          <FloatingInput idName='purokStreet' placeholder='Purok / Street' type='text' />
        </div>
        <div className="col-2 py-2">
          <FloatingInput idName='brgy' placeholder='Barangay' type='text' />
        </div>
        <div className="col py-2">
          <FloatingInput idName='municipality' placeholder='Municipality / Town' type='text' />
        </div>
        <div className="col py-2">
          <FloatingInput idName='province' placeholder='Provice' type='text' />
        </div>
        <div className="col py-2">
          <FloatingInput idName='zipCode' placeholder='ZIP code / Postal Code' type='number' />
        </div>
      </div>

      <div className="row">
        <div className="col">
          <div className="row">
            <div className="col py-2">
              <FloatingInput idName='nameFather' placeholder="Father's name" type='text' />
            </div>
            <div className="col py-2">
              <FloatingInput type='fatherNum' placeholder='Contact Number' idName='number' />
            </div>
          </div>
          <div className="row">
            <div className="col py-2">
              <FloatingInput idName='nameMother' placeholder="Mother's name" type='text' />
            </div>
            <div className="col py-2">
              <FloatingInput idName='motherNum' placeholder='Contact number' type='number' />
            </div>
          </div>
          <div className="row">
            <div className="col py-2">
              <FloatingInput idName='nameGuardian' placeholder="Guardian's name" type='text' />
            </div>
            <div className="col py-2">
              <FloatingInput idName='guardianNum' placeholder='Contact number' type='number' />
            </div>
          </div>
        </div>
      </div>
    </>
  )
}
export default AddressContact