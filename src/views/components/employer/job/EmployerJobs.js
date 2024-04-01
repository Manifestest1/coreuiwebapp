import { BrowserRouter as Router, Switch, Route, Link, NavLink,useNavigate } from 'react-router-dom';
import React,{ useEffect, useState } from 'react';
import {getJobonEmployer,searchJobGet} from '../../../../apiService'

const EmployerJobs = ()=>{

  const [searchTerm, setSearchTerm] = useState('');
  const [searchResults, setSearchResults] = useState([]);
  const [jobResults, setJobResults] = useState([]); 

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
      }, []); // Empty dependency array to ensure the effect runs only once

    return(
        <>
        <main>

        {/* <!-- Hero Area Start--> */}
            <div class="slider-area ">
                <div class="single-slider section-overly slider-height2 d-flex align-items-center" style={{ backgroundImage: `url(assets/img/hero/about.jpg)` }}>
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
                            <input style={{height:50,marginTop:'4px'}} type="text" className="form-control" placeholder="Search job title or location..." onChange={handleChange} name="keyword"/>
                            </div>
                            <div className='col-lg-2'>
                                <button type='submit' className='btn'>Find Jobs</button>
                            </div>
                            <div className='col-lg-2'>
                               <NavLink to="/employer-job-create" className="btn head-btn2">Job Create</NavLink>
                            </div>
                            <table style={{textAlign:'center',marginTop:'50px'}} className="table table-striped">
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
                                    {searchResults.map(job => (
                                        <tr key={job.id}>
                                            <td>{job.id}</td>
                                            <td>{job.title}</td>
                                            <td>{job.location}</td>
                                            <td>{job.description}</td>
                                            <td>
                                            <NavLink to={`/employer-job-view/${job.id}`}><i style={{color:'black'}} class="fa fa-eye fa-lg"></i></NavLink>
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