import axios from "axios"

const InsertData = (props) => {

    axios.post("http://localhost:8081/insert-student-data", {
      username: username,
      password: md5(password),
    }).then((response) => {
      console.log(response);
      if (response.data === 'Failed') {
        alert('Invalid Username / Password');
      } else {
        // add user session
        location.href = '/nemesis/dashboard'
      }
    })
}

export default InsertData