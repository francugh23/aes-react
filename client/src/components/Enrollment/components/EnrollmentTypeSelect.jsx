const EnrollmentTypeSelect = () => {
  return (
    <>
      <select name="enrollmentTypeSelect" id="enrollmentTypeSelect" className="form-select alert border fs-6 mb-3 shadow-sm">
        <option value="new">New</option>
        <option value="old" disabled>Old</option>
        <option value="trans" disabled>Transferee</option>
      </select>
    </>
  )
}

export default EnrollmentTypeSelect