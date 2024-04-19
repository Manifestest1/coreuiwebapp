
import { BrowserRouter as Router, Switch, Route, Link, NavLink,useNavigate } from 'react-router-dom';
import React,{ useEffect, useState } from 'react';
import {updateEmployerProfile } from '../../../../apiService';

const EmployerEditProfile = ({user,setUser})=>{
    const navigate = useNavigate()
    const [selectedImage, setSelectedImage] = useState(null);

      const handleChange = (e) => {
        const { name, value, type } = e.target;
        if (name.startsWith('employer.')) {
            const employerField = name.split('.')[1];
            setUser((prevUser) => ({
                ...prevUser,
                employer: {
                    ...prevUser.employer,
                    [employerField]: value
                }
            }));
        } else {
            // If not a nested field, update directly
            setUser((prevUser) => ({
                ...prevUser,
                [name]: value
            }));
        }
    };


      const handleSubmit = (e) => {
        e.preventDefault();
        const formData = new FormData();
    
        // Append user data
        if (user.name) formData.append('name', user.name);
        if (user.employer?.phone) formData.append('phone', user.employer.phone);
        if (user.employer?.current_address) formData.append('current_address', user.employer?.current_address);
        if (user.employer?.permanent_address) formData.append('permanent_address', user.employer?.permanent_address);
        if (user.employer?.adhar_card_no) formData.append('adhar_card_no', user.employer?.adhar_card_no);
        if (user.employer?.qualification) formData.append('qualification', user.employer?.qualification);
        if (user.employer?.certifications) formData.append('certifications', user.employer?.certifications);
        if (user.employer?.skills) formData.append('skills', user.employer?.skills);
        if (user.employer?.working_from) formData.append('working_from', user.employer?.working_from);
        if (user.employer?.work_experience) formData.append('work_experience', user.employer?.work_experience);
        if (user.employer?.current_working_skill) formData.append('current_working_skill', user.employer?.current_working_skill);
        if (user.employer?.languages) formData.append('languages', user.employer?.languages);
        if (user.employer?.hobbies) formData.append('hobbies', user.employer?.hobbies);
        if (user.employer?.city) formData.append('city', user.employer?.city);
        if (user.employer?.state) formData.append('state', user.employer?.state);
        if (user.employer?.country) formData.append('country', user.employer?.country);
        if (user.employer?.pincode) formData.append('pincode', user.employer?.pincode);
    
        updateEmployerProfile (formData)
              .then((response) => {
                setUser(response.data);

                navigate('/employer-profile');
                console.warn('Edit result', response);
              })
              .catch((error) => {
                console.error('Edit error', error);
              });
       
       };
    return(
        <>
{user ? ( 
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
                 <h4>Update Profile</h4>
           </div>
            {/* <!-- Select job items start --> */}
            <div class="select-job-items2">
            <form onSubmit={handleSubmit}>
            <div className='row'>
                <div className='col-lg-2'>
                    <label className='mt-30'>Name</label>
                </div>
                <div className='col-lg-10'>
                    <input className="form-control mt-30" type="text" value={user.name} onChange={handleChange} name="name"/>
                </div>

                <div className='col-lg-2'>
                    <label className='mt-30'>Email</label>
                </div>
                <div className='col-lg-10'>
                    <input className="form-control mt-30" type="text" value={user.email} onChange={handleChange} name="email"/>
                </div>

                <div className='col-lg-2'>
                    <label className='mt-30'>Mobile Number</label>
                </div>
                <div className='col-lg-10'>
                    <input className="form-control mt-30" type="number"value={user.phone} onChange={handleChange} name="phone"/>
                </div>

                <div className='col-lg-2'>
                    <label className='mt-30'>Current Address</label>
                </div>
                <div className='col-lg-10'>
                    <input className="form-control mt-30" type="text"value={user.current_address} onChange={handleChange} name="current_address"/>  
                </div>

                <div className='col-lg-2'>
                    <label className='mt-30'>Permanent Address</label>
                </div>
                <div className='col-lg-10'>
                    <input className="form-control mt-30" type="text"value={user.permanent_address} onChange={handleChange} name="permanent_address"/>  
                </div>

                <div className='col-lg-2'>
                    <label className='mt-30'>Aadhar Number</label>
                </div>
                <div className='col-lg-10'>
                    <input className="form-control mt-30" type="text"value={user.adhar_card_no} onChange={handleChange} name="adhar_card_no"/>  
                </div>

                <div className='col-lg-2'>
                    <label className='mt-30'>Qualification</label>
                </div>
                <div className='col-lg-10'>
                    <input className="form-control mt-30" type="text"value={user.qualification} onChange={handleChange} name="qualification"/>  
                </div>

                <div className='col-lg-2'>
                    <label className='mt-30'>Certifications</label>
                </div>
                <div className='col-lg-10'>
                    <input className="form-control mt-30" type="text"value={user.certifications} onChange={handleChange} name="certifications"/>  
                </div>

                <div className='col-lg-2'>
                    <label className='mt-30'>Skills</label>
                </div>
                <div className='col-lg-10'>
                    <input className="form-control mt-30" type="text"value={user.skills} onChange={handleChange} name="skills"/>  
                </div>

                <div className='col-lg-2'>
                    <label className='mt-30'>Working From</label>
                </div>
                <div className='col-lg-10'>
                    <input className="form-control mt-30" type="text"value={user.working_from} onChange={handleChange} name="working_from"/>  
                </div>

                <div className='col-lg-2'>
                    <label className='mt-30'>Work Experience</label>
                </div>
                <div className='col-lg-10'>
                    <input className="form-control mt-30" type="text"value={user.work_experience} onChange={handleChange} name="work_experience"/>  
                </div>

                <div className='col-lg-2'>
                    <label className='mt-30'>Current working skill</label>
                </div>
                <div className='col-lg-10'>
                    <input className="form-control mt-30" type="text"value={user.current_working_skill} onChange={handleChange} name="current_working_skill"/>  
                </div>

                <div className='col-lg-2'>
                    <label className='mt-30'>Languages</label>
                </div>
                <div className='col-lg-10'>
                    <input className="form-control mt-30" type="text"value={user.languages} onChange={handleChange} name="languages"/>  
                </div>

                <div className='col-lg-2'>
                    <label className='mt-30'>Hobbies</label>
                </div>
                <div className='col-lg-10'>
                    <input className="form-control mt-30" type="text"value={user.hobbies} onChange={handleChange} name="hobbies"/>  
                </div>

                <div className='col-lg-2'>
                    <label className='mt-30'>Country</label>
                </div>
                <div className='col-lg-10'>
                    <input className="form-control mt-30" type="text"value={user.country} onChange={handleChange} name="country"/>  
                </div>

                <div className='col-lg-2'>
                    <label className='mt-30'>State</label>
                </div>
                <div className='col-lg-10'>
                    <input className="form-control mt-30" type="text"value={user.state} onChange={handleChange} name="state"/>  
                </div>

                <div className='col-lg-2'>
                    <label className='mt-30'>City</label>
                </div>
                <div className='col-lg-10'>
                    <input className="form-control mt-30" type="text"value={user.city} onChange={handleChange} name="city"/>  
                </div>

                <div className='col-lg-2'>
                    <label className='mt-30'>Pincode</label>
                </div>
                <div className='col-lg-10'>
                    <input className="form-control mt-30" type="text"value={user.pincode} onChange={handleChange} name="pincode"/>  
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
                    <button type='submit' className="btn head-btn2 mt-50">Update</button>
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
</main>) : (
    <p className="btn head-btn2">Login</p> 
)}
        </>
    )
}
export default EmployerEditProfile