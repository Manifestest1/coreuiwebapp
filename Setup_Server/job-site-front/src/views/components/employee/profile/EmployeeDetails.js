import React, { useState, useEffect } from 'react';
import { getEmployee } from '../../../../apiService';
import { NavLink } from 'react-router-dom';

const EmployeeDetails = () => {
    const [employeeDetails, setEmployeeDetails] = useState([]);
    useEffect(() => {
      const fetchData = async () => {
        try {
          const response = await getEmployee();
          setEmployeeDetails(response.data);
          console.log(' employee details:', response.data);
        } catch (error) {
          console.error('Error fetching employee details:', error);
        }
      };
      fetchData();
    }, []);
    return (
        <main>
          <div className="slider-area">
            <div className="single-slider section-overly slider-height2 d-flex align-items-center single-slider-contact" >
              <div className="container">
                <div className="row">
                  <div className="col-xl-12">
                    <div className="hero-cap text-center">
                      <h2>Employee Details</h2>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div className="job-listing-area pt-120 pb-120">
            <div className="container">
              <div className="row">
                <div className="col-lg-12 col-md-12">
                  <div className="job-category-listing mb-50">
                    <div className="single-listing">
                      <div className="select-job-items2">
                        <div className="row">
                          <div className="col-lg-12">
                            <table  className="table table-striped">
                              <thead>
                                <tr>
                                  <th>Serial no</th>
                                  <th>Employee details</th>
                                </tr>
                              </thead>
                              <tbody>
                                {employeeDetails.map((employee, index) => (
                                  <tr key={employee.id}>
                                    <td>{index + 1}</td>
                                    <td className='fav-title' >
                                        <NavLink className='fav-title' to={`/employee-public-profile/${employee.id}`}>{employee.name}</NavLink>
                                    </td> 
                                  </tr>
                                ))}
                              </tbody>
                            </table>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </main>
      );
    };

export default EmployeeDetails