import { BrowserRouter as Router, Switch, Route, Link, NavLink,useNavigate } from 'react-router-dom';
import React,{ useEffect, useState } from 'react';
import {getJobonEmployer,searchJobGet} from '../../../../apiService'

const EmployerJobs = ()=>{
  const [searchTerm, setSearchTerm] = useState('');
  const [searchResults, setSearchResults] = useState([]);
  const [jobResults, setJobResults] = useState([]); 
  const navigate = useNavigate();
  const handleChange = (e) => {
    const { name, value } = e.target;
     setSearchTerm((prevUser) => ({ ...prevUser, [name]: value }));
    };

  const handleSearch = (e) => {
    e.preventDefault(); 
    const formData = new FormData();
    formData.append('keyword', searchTerm.keyword);
    searchJobGet(formData)
    .then((response) => {
        setSearchResults(response.data);
    })
    .catch((error) => {
      console.error('Job Post error', error); 
    });
  };
    useEffect(() => {
      getJobonEmployer()
      .then((r) => {
          console.log(r,"Job Get");
          setSearchResults(r.data.job);
          setJobResults(r.data.userJobPosts);
      })
      .catch((e) => {
          console.log(e);
      });
    }, []); 

    const handlejobcreate = ()=>{
      navigate('/employer-job-create');
    }

  return(
    <>
      <main>
          <div class="slider-area ">
              <div class="single-slider section-overly slider-height2 d-flex align-items-center single-slider-contact" >
                  <div class="container">
                      <div class="row">
                          <div class="col-xl-12">
                              <div class="hero-cap text-center">
                                  <h2>Employer Jobs</h2>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
        <div class="job-listing-area pt-120 pb-120">
          <div class="container">
            <div class="row">
              <div class="col-lg-12 col-md-12">
                <div class="job-category-listing mb-50">
                  <div class="single-listing">
                    <div class="select-job-items2">
                      <form onSubmit={handleSearch}>
                        <div className='row'>
                          <div className='col-lg-8'>
                          <input id='in-put' type="text" className="form-control" placeholder="Search job title or location..." onChange={handleChange} name="keyword"/>
                          </div>
                          <div className='col-lg-2'>
                              <button id='create_job' type='submit' class="genric-btn success-border radius">Find Jobs</button>
                          </div>
                          <div className='col-lg-2'>
                             <button  onClick={handlejobcreate} class="genric-btn success-border radius">Job Create</button>
                          </div>
                          <div className='col-lg-2'id='job' >
                            <p className="fw-bold" id='emp-job-1' >
                              Jobs <span id='emp-job-2' >{searchResults.length}</span> 
                            </p>
                          </div>
                          <table id='emp-job-3'  className="table table-striped">
                            <thead>
                              <tr>
                                <th>ID</th>
                                <th>Job</th>
                                <th>Location</th>
                                <th>Description</th> 
                                <th>Action</th>
                              </tr>
                            </thead>
                            <tbody>
                              {searchResults.map((job, index) => (
                                <tr key={job.id}>
                                  <td>{index + 1}</td>
                                  <td>
                                    <NavLink className="nav-link-style"  to={`/employee-job-view/${job.id}`}>{job.title}</NavLink>
                                  </td>
                                  <td>{job.location}</td>
                                  <td>{job.description}</td>
                                  <td>
                                    <NavLink to={`/employer-job-view/${job.id}`}>
                                      <i id='emp-job-4'  class="fa fa-eye fa-lg"></i>
                                    </NavLink>
                                  </td>
                                </tr>
                              ))}
                            </tbody>
                          </table>
                        </div>
                      </form>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </main>
    </>
  )
}

export default EmployerJobs