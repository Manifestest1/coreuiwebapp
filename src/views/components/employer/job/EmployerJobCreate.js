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
    
        // Append Job data
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
            // Optionally handle error response
        });
    };
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
                        <h2>Update Profile</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="job-listing-area pt-120 pb-120">
<div class="container">
<div class="row">
{/* <!-- Left content --> */}
<div class="col-lg-12 col-md-12">
    {/* <div class="row">
        <div class="col-12">
            <div class="small-section-tittle2 mb-45">
                <h4>Create Profile</h4>
            </div>
        </div>
    </div> */}
    {/* <!-- Job Category Listing start --> */}
    <div class="job-category-listing mb-50">
        {/* <!-- single one --> */}
        <div class="single-listing">
           <div class="small-section-tittle2"> 
                 <h4>Create Job</h4>
           </div>
            {/* <!-- Select job items start --> */}
            <div class="select-job-items2">
            <form onSubmit={handleJobSubmit}>
            <div className='row'>
                <div className='col-lg-2'>
                    <label >Job Title</label>
                </div>
                <div className='col-lg-10'>
                    <input className={`form-control ${errors.title ? "is-invalid" : ""}`}  
                    onChange={handleChange} 
                    name="title" 
                    type="text"/>
                    value={jobs.title || ''}
                    {errors.title && <span style={{color:'red'}} className="error-message">{errors.title}</span>}
                </div>

                <div className='col-lg-2'>
                    <label >Description</label>
                </div>
                <div className='col-lg-10'>
                    <input className={`form-control ${errors.description ? "is-invalid" : ""}`}  
                    onChange={handleChange} 
                    name="description" 
                    type="text"/>
                    value={jobs.description|| ''}
                    {errors.description && <span className="error-message" style={{ color: 'red' }}>{errors.description}</span>}
                </div>

                <div className='col-lg-2'>
                    <label >Location</label>
                </div>
                <div className='col-lg-10'>
                    <input className={`form-control ${errors.location ? "is-invalid" : ""}`}  
                    onChange={handleChange} 
                    name="location" 
                    type="text"/>
                    value={jobs.location|| ''}
                     {errors.location && <span style={{color:'red'}} className="error-message">{errors.location}</span>}
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
                    <button type='submit' className="btn head-btn2 mt-50">Job Post</button>
                    </div>
                </div>
            </form> 
            </div>
           
            {/* <!-- select-Categories End --> */}
        </div>
        
    </div>
    {/* <!-- Job Category Listing End --> */}
</div>

</div>
</div>
</div>
</main>
        </>
    )
}

export default EmployerJobCreate