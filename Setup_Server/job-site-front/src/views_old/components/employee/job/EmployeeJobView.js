import { BrowserRouter as Router, Switch, Route, useParams, NavLink,useNavigate } from 'react-router-dom';
import React,{ useEffect, useState } from 'react';
import {getJobViewEmployee,jobApplyEmployee} from '../../../../apiService'

const EmployeeJobView = ()=>
{
    const { jobId } = useParams();
    const navigate = useNavigate()
    const [job, setJob] = useState({name: '',phone: null,imageurl: null});

    const handleJobApply = (e) => {
        e.preventDefault();
        jobApplyEmployee(jobId)
              .then((response) => {
                navigate('/employee-jobs');
                console.warn('Edit result', response);
              })
              .catch((error) => {
                console.error('Edit error', error);
              });
       
       };
    
      useEffect(() => {
        getJobViewEmployee(jobId)
        .then((r) => {
          setJob(r.data);
        })
        .catch((e) => {
            console.log(e)
        });
      }, []); 
    return(
        <>
            <main>
                <div class="slider-area ">
                    <div class="single-slider section-overly slider-height2 d-flex align-items-center single-slider-contact" >
                        <div class="container">
                            <div class="row">
                                <div class="col-xl-12">
                                    <div class="hero-cap text-center">
                                        <h2>{job.title}</h2>
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
                                    {/* <!-- single one --> */}
                                    <div class="single-listing">
                                       <div class="small-section-tittle2"> 
                                             <h4>Job Apply</h4>
                                       </div>
                                        {/* <!-- Select job items start --> */}
                                        <div class="select-job-items2">
                                            <form onSubmit={handleJobApply}>
                                                <div className='row'>
                                                    <div className='col-lg-2'>
                                                        <label className='mt-30'>Job Title</label>
                                                    </div>
                                                    <div className='col-lg-10'>
                                                        <input className="form-control mt-30" value={job.title} name="title" type="text"/>
                                                    </div>
                                    
                                                    <div className='col-lg-2'>
                                                        <label className='mt-30'>Description</label>
                                                    </div>
                                                    <div className='col-lg-10'>
                                                        <input className="form-control mt-30" value={job.description} name="description" type="text"/>
                                                    </div>
                                    
                                                    <div className='col-lg-2'>
                                                        <label className='mt-30'>Location</label>
                                                    </div>
                                                    <div className='col-lg-10'>
                                                        <input className="form-control mt-30" value={job.location} name="location" type="text"/>
                                                    </div>
                                                </div>
                                                    {/* <select className="form-control mt-30" name="select">
                                                        <option value="">All Category</option>
                                                        <option value="1">Employee</option>
                                                        <option value="2">Employer</option>
                                                    </select> */}
                                                <div class="row">
                                                    <div className='col-lg-5'></div>
                                                    <div className='col-lg-5'>
                                                    <button type='submit' class="genric-btn success-border radius mt-50">Job Apply</button>
                                                    </div>
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

export default EmployeeJobView