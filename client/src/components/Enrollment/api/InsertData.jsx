import axios from "axios"
import { useEffect, useState } from "react"

const InsertData = (props) => {

  axios.post("http://localhost:3000/insert-student-data", {
    // Learner's Information
    idNumber: props.idNumber,
    studentType: props.studentType,
    firstname: props.firstname,
    middlename: props.middlename,
    lastname: props.lastname,
    gender: props.gender,
    birthday: props.birthday,
    lrn: props.lrn,
    grade: props.grade,
    section: props.section,

    // Address & Contact
    street: props.street,
    brgy: props.brgy,
    municipality: props.municipality,
    province: props.province,
    postal: props.postal,

    fatherName: props.fatherName,
    fatherContact: props.fatherContact,
    motherName: props.motherName,
    motherContact: props.motherContact,
    guardianName: props.guardianName,
    guardianContact: props.guardianContact,
    
  }).then((response) => {
    console.log(response);
    if (response.data === 'Failed') {
      alert('Failed');
    } else {
      // add user session
      alert('Success');
    }
  })
}

export default InsertData