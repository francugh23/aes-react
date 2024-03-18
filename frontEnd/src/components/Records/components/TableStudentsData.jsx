import axios from 'axios'
import { useEffect, useState } from 'react'

const TableStudentsData = () => {

  const [studentsData, setStudentsData] = useState([]);
  useEffect(() => {
    axios.get('http://localhost:8081/fetch-student-data')
      .then(res => {
        console.log(res)
        setStudentsData(res.data)
      }).catch(err => {
        console.log(err)
      })

  }, []);

  return (
    <>
      <table className="table">
        <thead>
          <tr>
            <th scope="col">Student ID</th>
            <th scope="col">Name</th>
            <th scope="col">Birth Date</th>
            <th scope="col">IP</th>
          </tr>
        </thead>
        <tbody>
          {studentsData.map((data, index) => {
            return (
              <tr key={index}>
                <td>{data.student_id}</td>
                <td>
                  {data.first_name} 
                  {data.middle_name} 
                  {data.last_name}
                </td>
                <td>{data.bdate}</td>
                <td>{data.ip}</td>
              </tr>
            )
          })}
        </tbody>
      </table>
    </>
  )
}

export default TableStudentsData