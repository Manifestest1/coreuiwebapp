import { useParams, useNavigate } from 'react-router-dom';
import React,{ useEffect, useState } from 'react';
import {getJobViewEmployee,jobApplyEmployee} from '../../../../apiService'

const EmployeeJobView = ()=>
{
    const { jobId } = useParams();
    const navigate = useNavigate()
    const [job, setJob] = useState({ title: '', description: '', location: '' });
    
    const handleJobApply = (e) => {
        e.preventDefault();
        jobApplyEmployee(jobId)
            .then((response) => {
                navigate('/employee-jobs');
                console.warn('Job apply result', response);
            })
            .catch((error) => {
                console.error('Job apply error', error);
            });
    };
    
    useEffect(() => {
        getJobViewEmployee(jobId)
            .then((response) => {
                setJob(response.data);
            })
            .catch((error) => {
                console.error('Error fetching job details', error);
            });
    }, [jobId]);
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
                
                <div className="job-listing-area pt-120 pb-120">
                    <div className="container">
                        <div className="row">
                            <div className="col-lg-12 col-md-12">
                                <div className="job-category-listing mb-50">
                                    <div className="single-listing">
                                        <div className="small-section-tittle2">
                                            <h4>Job Details</h4>
                                        </div>
                                        <div className="select-job-items2">
                                            <div className="row">
                                                <div className="col-lg-2">
                                                    <label className="mt-30">Job Title</label>
                                                </div>
                                                <div className="col-lg-10">
                                                    <p className=" mt-30">{job.title}</p>
                                                </div>

                                                <div className="col-lg-2">
                                                    <label className="mt-30">Description</label>
                                                </div>
                                                <div className="col-lg-10">
                                                    <p className=" mt-30">{job.description} Years</p>
                                                </div>

                                                <div className="col-lg-2">
                                                    <label className="mt-30">Location</label>
                                                </div>
                                                <div className="col-lg-10">
                                                    <p className=" mt-30">{job.location}</p>
                                                </div>
                                            </div>
                                            <div className="row">
                                                <div className="col-lg-5"></div>
                                                <div className="col-lg-5">
                                                    <button type="submit" className="genric-btn success-border radius mt-50" onClick={handleJobApply}>
                                                        Apply for Job
                                                    </button>
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
        </>
    )
}

export default EmployeeJobView