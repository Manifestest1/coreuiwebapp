import { BrowserRouter as Router, Switch, Route, Link, NavLink,useNavigate } from 'react-router-dom';
import React,{ useEffect, useState } from 'react';
import { createJobPost } from '../../../../apiService';

const EmployerJobCreate = ()=>{
    const [jobs, setjobs] = useState({title: '',description: '',location: '',company_type: '',job_type: '',posted_within: '',department: '',duration: '',education: '',industry: '',salary: ''});
    const [isValid, setIsValid] = useState(true);
    const navigate = useNavigate()
    const [errors, setErrors] = useState({
        title: "",
        description: "",
        location: "",
        company_type: '',
        job_type: '',
        posted_within: '',
        department: '',
        duration: '',
        education: '',
        industry: '',
        salary: ''
    });

    const handleChange = (e) => {
        const { name, value, type } = e.target;
        setIsValid(e.target.value.length > 0); 
        setjobs((prevUser) => ({ ...prevUser, [name]: value }));
        setErrors((prevErrors) => ({ ...prevErrors, [name]: "" }));
    };

      const handleJobSubmit = (e) => {
        e.preventDefault();
        const newErrors = {};
        if (!jobs.title.trim()) {
            newErrors.title = "Title is required";
        }
        if (!jobs.description.trim()) {
            newErrors.description = "description is required";
        }
        if (!jobs.location.trim()) {
            newErrors.location = "location is required";
        }
        if (!jobs.company_type.trim()) {
            newErrors.company_type = "company_type is required";
        }
        if (!jobs.job_type.trim()) {
            newErrors.job_type = "job_type is required";
        }
        if (!jobs.posted_within.trim()) {
            newErrors.posted_within = "posted_within  is required";
        }
        if (!jobs.department.trim()) {
            newErrors.department = "department is required";
        }
        if (!jobs.duration.trim()) {
            newErrors.duration = "duration is required";
        }
        if (!jobs.education.trim()) {
            newErrors.education = "education is required";
        }
        if (!jobs.industry.trim()) {
            newErrors.industry = "industry is required";
        }
        if (!jobs.salary.trim()) {
            newErrors.salary = "salary is required";
        } else if (isNaN(jobs.salary) || Number(jobs.salary) < 0) {
            newErrors.salary = "Salary must be a positive number";
        }
        if (Object.keys(newErrors).length > 0) {
            setErrors(newErrors);
            return;
        }
        const formData = new FormData();
        formData.append('title', jobs.title);
        formData.append('description', jobs.description);
        formData.append('location', jobs.location);
        formData.append('company_type', jobs.company_type);
        formData.append('job_type', jobs.job_type);
        formData.append('posted_within', jobs.posted_within);
        formData.append('department', jobs.department);
        formData.append('duration', jobs.duration);
        formData.append('education', jobs.education);
        formData.append('industry', jobs.industry);
        formData.append('salary', jobs.salary);
        createJobPost(formData)
        .then((response) => {
            console.warn('Job Post result', response);
            navigate('/employer-jobs');
        })
        .catch((error) => {
            console.error('Job Post error', error);
        });
    };
    return(
        <>
            <main>
                <div class="slider-area ">
                    <div class="single-slider section-overly slider-height2 d-flex align-items-center" style={{ backgroundImage: `url(assets/img/hero/about.jpg)` }}>
                        <div class="container">
                            <div class="row">
                                <div class="col-xl-12">
                                    <div class="hero-cap text-center">
                                        <h2>Create Job</h2>
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
                                        <div class="small-section-tittle2"> 
                                            <h4>Create Job</h4>
                                        </div>
                                        <div class="select-job-items2">
                                            <form onSubmit={handleJobSubmit}>
                                                <div className='row'>
                                                        <label className='col-lg-2'>Job Title</label>
                                                        <input className="form-control col-lg-10" 
                                                        onChange={handleChange} 
                                                        name="title" 
                                                        type="text"
                                                        style={{ borderColor: errors.title ? 'red' : '' }}
                                                        value={jobs.title || ''}/>
                                                        {errors.title && <span className="error-message">{errors.title}</span>}
                                                    </div>

                                                    <div className='row'>
                                                        <label className='mt-30 col-lg-2'>Experience</label>
                                                        <input className="form-control mt-30 col-lg-10"  
                                                        onChange={handleChange} 
                                                        name="description" 
                                                        type="text"
                                                        style={{ borderColor: errors.description ? 'red' : '' }}
                                                        value={jobs.description|| ''}/>
                                                        {errors.description && <span className="error-message" >{errors.description}</span>}
                                                    </div>
                                    
                                                    <div className='row'>
                                                        <label className='mt-30 col-lg-2'>Location</label>
                                                        <input className="form-control mt-30 col-lg-10"  
                                                        onChange={handleChange} 
                                                        name="location" 
                                                        type="text"
                                                        style={{ borderColor: errors.location ? 'red' : '' }}
                                                        value={jobs.location|| ''}/>
                                                         {errors.location && <span  className="error-message">{errors.location}</span>}
                                                    </div>

                                                    <div className='row'>
                                                        <label className='mt-30 col-lg-2'>Company Type</label>
                                                        <input className="form-control mt-30 col-lg-10"  
                                                        onChange={handleChange} 
                                                        name="company_type" 
                                                        type="text"
                                                        style={{ borderColor: errors.company_type ? 'red' : '' }}
                                                        value={jobs.company_type|| ''}/>
                                                         {errors.company_type && <span  className="error-message">{errors.company_type}</span>}
                                                    </div>

                                                    <div className='row'>
                                                        <label className='mt-30 col-lg-2'>Job Type</label>
                                                        <input className="form-control mt-30 col-lg-10"  
                                                        onChange={handleChange} 
                                                        name="job_type" 
                                                        type="text"
                                                        style={{ borderColor: errors.job_type ? 'red' : '' }}
                                                        value={jobs.job_type|| ''}/>
                                                         {errors.job_type && <span  className="error-message">{errors.job_type}</span>}
                                                    </div>

                                                    <div className='row'>
                                                        <label className='mt-30 col-lg-2'>posted Within</label>
                                                        <input className="form-control mt-30 col-lg-10"  
                                                        onChange={handleChange} 
                                                        name="posted_within" 
                                                        type="text"
                                                        style={{ borderColor: errors.posted_within ? 'red' : '' }}
                                                        value={jobs.posted_within|| ''}/>
                                                         {errors.posted_within && <span  className="error-message">{errors.posted_within}</span>}
                                                    </div>

                                                    <div className='row'>
                                                        <label className='mt-30 col-lg-2'>Department</label>
                                                        <input className="form-control mt-30 col-lg-10"  
                                                        onChange={handleChange} 
                                                        name="department" 
                                                        type="text"
                                                        style={{ borderColor: errors.department ? 'red' : '' }}
                                                        value={jobs.department|| ''}/>
                                                         {errors.department && <span  className="error-message">{errors.department}</span>}
                                                    </div>

                                                    <div className='row'>
                                                        <label className='mt-30 col-lg-2'>Duration</label>
                                                        <input className="form-control mt-30 col-lg-10"  
                                                        onChange={handleChange} 
                                                        name="duration" 
                                                        type="text"
                                                        style={{ borderColor: errors.duration ? 'red' : '' }}
                                                        value={jobs.duration|| ''}/>
                                                         {errors.duration && <span  className="error-message">{errors.duration}</span>}
                                                    </div>

                                                    <div className='row'>
                                                        <label className='mt-30 col-lg-2'>Education</label>
                                                        <input className="form-control mt-30 col-lg-10"  
                                                        onChange={handleChange} 
                                                        name="education" 
                                                        type="text"
                                                        style={{ borderColor: errors.education ? 'red' : '' }}
                                                        value={jobs.education|| ''}/>
                                                         {errors.education && <span  className="error-message">{errors.education}</span>}
                                                    </div>

                                                    <div className='row'>
                                                        <label className='mt-30 col-lg-2'>Industry</label>
                                                        <input className="form-control mt-30 col-lg-10"  
                                                        onChange={handleChange} 
                                                        name="industry" 
                                                        type="text"
                                                        style={{ borderColor: errors.industry ? 'red' : '' }}
                                                        value={jobs.industry|| ''}/>
                                                         {errors.industry && <span  className="error-message">{errors.industry}</span>}
                                                    </div>

                                                    <div className='row'>
                                                        <label className='mt-30 col-lg-2'>Salary</label>
                                                        <input className="form-control mt-30 col-lg-10"  
                                                        onChange={handleChange} 
                                                        name="salary" 
                                                        type="text"
                                                        style={{ borderColor: errors.salary ? 'red' : '' }}
                                                        value={jobs.salary|| ''}/>
                                                         {errors.salary && <span  className="error-message">{errors.salary}</span>}
                                                    </div>

                                                <div class="row">
                                                    <div className='col-lg-5'></div>
                                                    <div className='col-lg-5'>
                                                        <button id='createjobButton' type='submit' className="genric-btn success-border radius">Job Post</button>
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

export default EmployerJobCreate