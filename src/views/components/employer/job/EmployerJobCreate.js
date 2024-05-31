import { BrowserRouter as Router, Switch, Route, Link, NavLink,useNavigate } from 'react-router-dom';
import React,{ useEffect, useState } from 'react';
import {createJobPost} from '../../../../apiService';

const EmployerJobCreate = ()=>{
    const [jobs, setjobs] = useState({title: '',description: '',location: ''});
    const [isValid, setIsValid] = useState(true);
    const navigate = useNavigate()
    const [errors, setErrors] = useState({
        title: "",
        description: "",
        location: "",
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
        if (Object.keys(newErrors).length > 0) {
            setErrors(newErrors);
            return;
        }
        const formData = new FormData();
        formData.append('title', jobs.title);
        formData.append('description', jobs.description);
        formData.append('location', jobs.location);
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
                                                    <div className='col-lg-2'>
                                                        <label >Job Title</label>
                                                    </div>
                                                    <div className='col-lg-10 '>
                                                        <input className="form-control " 
                                                        onChange={handleChange} 
                                                        name="title" 
                                                        type="text"
                                                        style={{ borderColor: errors.title ? 'red' : '' }}
                                                        value={jobs.title || ''}/>
                                                        {errors.title && <span className="error-message">{errors.title}</span>}
                                                    </div>

                                                    <div className='col-lg-2'>
                                                        <label className='mt-30'>Description</label>
                                                    </div>
                                                    <div className='col-lg-10'>
                                                        <input className="form-control mt-30"  
                                                        onChange={handleChange} 
                                                        name="description" 
                                                        type="text"
                                                        style={{ borderColor: errors.description ? 'red' : '' }}
                                                        value={jobs.description|| ''}/>
                                                        {errors.description && <span className="error-message" >{errors.description}</span>}
                                                    </div>
                                    
                                                    <div className='col-lg-2'>
                                                        <label className='mt-30'>Location</label>
                                                    </div>
                                                    <div className='col-lg-10'>
                                                        <input className="form-control mt-30"  
                                                        onChange={handleChange} 
                                                        name="location" 
                                                        type="text"
                                                        style={{ borderColor: errors.location ? 'red' : '' }}
                                                        value={jobs.location|| ''}/>
                                                         {errors.location && <span  className="error-message">{errors.location}</span>}
                                                    </div>
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