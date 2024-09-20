
import { BrowserRouter as Router, Switch, Route, Link, NavLink,useNavigate } from 'react-router-dom';
import React,{ useEffect, useState } from 'react';
import {updateEmployeeProfile } from '../../../../apiService';

const EmployeeEditProfile = ({user,setUser})=>{
    const navigate = useNavigate()
    const [errors, setErrors] = useState({});
    
    const handleChange = (e) => {
        const { name, value } = e.target;
        if (name.startsWith('employee.')) {
            const employeeField = name.split('.')[1];
            setUser((prevUser) => ({
                ...prevUser,
                employee: {
                    ...prevUser.employee,
                    [employeeField]: value
                }
            }));
        } 
        
        else {
            setUser((prevUser) => ({
                ...prevUser,
                [name]: value
            }));
        }
    };

      const handleSubmit = (e) => {
        e.preventDefault();
        const formData = new FormData(); 

        const requiredFields = ['phone', 'current_address', 'qualification', 'skills', 'current_working_skill', 'languages','country', 'state', 'city', 'gender', 'permanent_address', 'working_from', 'work_experience'];
        const formatErrors = {};

        requiredFields.forEach(field => {
            if (!user.employee?.[field]) {
                formatErrors[field] = `${field.split('.').pop()} is required`;
            }
        });

        if (!user.email || !validateEmail(user.email)) {
            formatErrors['email'] = 'Email is required and should be in correct format';
        }

        if (!user.employee?.phone || !validatePhone(user.employee?.phone)) {
            formatErrors['phone'] = 'Phone number is required and should be in correct format';
        }

        if (Object.keys(formatErrors).length > 0) {
            setErrors(formatErrors);
            return;
        }
        setErrors({});
        // Append user data
        if (user.name) formData.append('name', user.name);
        if (user.employee?.phone) formData.append('phone', user.employee?.phone);
        if (user.employee?.current_address) formData.append('current_address', user.employee?.current_address);
        if (user.employee?.permanent_address) formData.append('permanent_address', user.employee?.permanent_address);
        if (user.employee?.adhar_card_no) formData.append('adhar_card_no', user.employee?.adhar_card_no);
        if (user.employee?.qualification) formData.append('qualification', user.employee?.qualification);
        if (user.employee?.certifications) formData.append('certifications', user.employee?.certifications);
        if (user.employee?.skills) formData.append('skills', user.employee?.skills);
        if (user.employee?.working_from) formData.append('working_from', user.employee?.working_from);
        if (user.employee?.work_experience) formData.append('work_experience', user.employee?.work_experience);
        if (user.employee?.current_working_skill) formData.append('current_working_skill', user.employee?.current_working_skill);
        if (user.employee?.languages) formData.append('languages', user.employee?.languages);
        if (user.employee?.hobbies) formData.append('hobbies', user.employee?.hobbies);
        if (user.employee?.city) formData.append('city', user.employee?.city);
        if (user.employee?.state) formData.append('state', user.employee?.state);
        if (user.employee?.country) formData.append('country', user.employee?.country);
        if (user.employee?.pincode) formData.append('pincode', user.employee?.pincode);
        if (user.employee?.gender) formData.append('gender', user.employee?.gender);
    
        
        updateEmployeeProfile(formData)
              .then((response) => {
                setUser(response.data);
                setErrors({});
                navigate('/employee-profile');
                console.warn('Edit result', response);
              })
              .catch((error) => {
                console.error('Edit error', error);
              });
       
       };

       const renderError = (fieldName) => {
        return errors[fieldName] ? <span className="error-message" id='error-mess'>{errors[fieldName]}</span> : null;
    };

    const validateEmail = (email) => {
        const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return re.test(String(email).toLowerCase());
    };

    // Function to validate phone number
    const validatePhone = (phone) => {
        const re = /^[0-9]{10}$/;
        return re.test(String(phone));
    };
    return(
        <>
            {user ? (
                <main>    
                    <div className="slider-area ">
                        <div className="single-slider section-overly slider-height2 d-flex align-items-center" style={{ backgroundImage: `url(assets/img/hero/about.jpg)` }}>
                            <div className="container">
                                <div className="row">
                                    <div className="col-xl-12">
                                        <div className="hero-cap text-center">
                                            <h2>Update Your Profile</h2>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div className="job-listing-area pt-120 pb-120">
                        <div className="container">
                            <div className="row">
                                {/* <!-- Left content --> */}
                                <div className="col-lg-12 col-md-12">
                                    <div className="job-category-listing mb-50">
                                        <div className="single-listing">
                                           <div className="small-section-tittle2"> 
                                                <h4>Update Profile</h4>
                                           </div>
                                            <div className="select-job-items2">
                                                <form onSubmit={handleSubmit}>
                                                    <div className='row'>
                                                        <div className='col-lg-2'>
                                                            <label className='mt-30'>Name</label>
                                                        </div>
                                                        <div className='col-lg-10'>
                                                            <input className="form-control mt-30" type="text" value={user.name} onChange={handleChange} name="name"/>
                                                        </div>
                                                    </div>
                                    
                                                    <div className='row'>
                                                        <div className='col-lg-2'>
                                                            <label className='mt-30'>Email</label>
                                                        </div>
                                                        <div className='col-lg-10'>
                                                            <input className="form-control mt-30" type="text" value={user.email} onChange={handleChange} name="email"/>
                                                            {renderError('email')}
                                                        </div>
                                                    </div >
                                    
                                                    <div className='row'>
                                                        <div className='col-lg-2'>
                                                            <label className='mt-30'>Mobile Number</label>
                                                        </div>
                                                        <div className='col-lg-10'>
                                                            <input className="form-control mt-30" type="number"value={user.employee?.phone} onChange={handleChange} name="employee.phone"/>
                                                            {renderError('phone')}
                                                        </div>
                                                    </div>
                                    
                                                    <div className='row'>
                                                        <div className='col-lg-2'>
                                                            <label className='mt-30'>Current Address</label>
                                                        </div>
                                                        <div className='col-lg-10'>
                                                            <input className="form-control mt-30" type="text"value={user.employee?.current_address} onChange={handleChange} name="employee.current_address"/>
                                                            {renderError('current_address')}  
                                                        </div>
                                                    </div>
                                        
                                                    <div className='row'>
                                                        <div className='col-lg-2'>
                                                            <label className='mt-30'>Permanent Address</label>
                                                        </div>
                                                        <div className='col-lg-10'>
                                                            <input className="form-control mt-30" type="text"value={user.employee?.permanent_address} onChange={handleChange} name="employee.permanent_address"/>
                                                            {renderError('permanent_address')}  
                                                        </div>
                                                    </div>
                                        
                                                    <div className='row'>    
                                                        <div className='col-lg-2'>
                                                            <label className='mt-30'>Aadhar Number</label>
                                                        </div>
                                                        <div className='col-lg-10'>
                                                            <input className="form-control mt-30" type="text"value={user.employee?.adhar_card_no} onChange={handleChange} name="employee.adhar_card_no"/> 
                                                        </div>
                                                    </div>
                                        
                                                    <div className='row'>
                                                        <div className='col-lg-2'>
                                                            <label className='mt-30'>Qualification</label>
                                                        </div>
                                                        <div className='col-lg-10'>
                                                            <input className="form-control mt-30" type="text"value={user.employee?.qualification} onChange={handleChange} name="employee.qualification"/>
                                                            {renderError('qualification')} 
                                                        </div>
                                                    </div>
                                        
                                                    <div className='row'>
                                                        <div className='col-lg-2'>
                                                            <label className='mt-30'>Certifications</label>
                                                        </div>
                                                        <div className='col-lg-10'>
                                                            <input className="form-control mt-30" type="text"value={user.employee?.certifications} onChange={handleChange} name="employee.certifications"/>  
                                                        </div>
                                                    </div>
                                        
                                                    <div className='row'>
                                                        <div className='col-lg-2'>
                                                            <label className='mt-30'>Skills</label>
                                                        </div>
                                                        <div className='col-lg-10'>
                                                            <input className="form-control mt-30" type="text"value={user.employee?.skills} onChange={handleChange} name="employee.skills"/>
                                                            {renderError('skills')}   
                                                        </div>
                                                    </div>
                                        
                                                    <div className='row'>
                                                        <div className='col-lg-2'>
                                                            <label className='mt-30'>Working From</label>
                                                        </div>
                                                        <div className='col-lg-10'>
                                                            <input className="form-control mt-30" type="text"value={user.employee?.working_from} onChange={handleChange} name="employee.working_from"/>
                                                            {renderError('working_from')}   
                                                        </div>
                                                    </div>
                                        
                                                    <div className='row'>
                                                        <div className='col-lg-2'>
                                                            <label className='mt-30'>Work Experience</label>
                                                        </div>
                                                        <div className='col-lg-10'>
                                                            <input className="form-control mt-30" type="text"value={user.employee?.work_experience} onChange={handleChange} name="employee.work_experience"/>
                                                            {renderError('work_experience')}   
                                                        </div>
                                                    </div>
                                    
                                                    <div className='row'>
                                                        <div className='col-lg-2'>
                                                            <label className='mt-30'>Current working skill</label>
                                                        </div>
                                                        <div className='col-lg-10'>
                                                            <input className="form-control mt-30" type="text"value={user.employee?.current_working_skill} onChange={handleChange} name="employee.current_working_skill"/> 
                                                            {renderError('current_working_skill')} 
                                                        </div>
                                                    </div>
                                        
                                                    <div className='row'>
                                                        <div className='col-lg-2'>
                                                            <label className='mt-30'>Languages</label>
                                                        </div>
                                                        <div className='col-lg-10'>
                                                            <input className="form-control mt-30" type="text"value={user.employee?.languages} onChange={handleChange} name="employee.languages"/>
                                                            {renderError('languages')}  
                                                        </div>
                                                    </div>
                                        
                                                    <div className='row'>
                                                        <div className='col-lg-2'>
                                                            <label className='mt-30'>Hobbies</label>
                                                        </div>
                                                        <div className='col-lg-10'>
                                                            <input className="form-control mt-30" type="text"value={user.employee?.hobbies} onChange={handleChange} name="employee.hobbies"/>  
                                                        </div>
                                                    </div>
                                        
                                                    <div className='row'>
                                                        <div className='col-lg-2'>
                                                            <label className='mt-30'>country</label>
                                                        </div>
                                                        <div className='col-lg-10'>
                                                            <input className="form-control mt-30" type="text"value={user.employee?.country} onChange={handleChange} name="employee.country"/>
                                                            {renderError('country')}   
                                                        </div>    
                                                    </div>
                                        
                                                    <div className='row'>
                                                        <div className='col-lg-2'>
                                                            <label className='mt-30'>State</label>
                                                        </div>
                                                        <div className='col-lg-10'>
                                                            <input className="form-control mt-30" type="text"value={user.employee?.state} onChange={handleChange} name="employee.state"/>
                                                            {renderError('state')}   
                                                        </div>
                                                    </div>
                                        
                                                    <div className='row'>
                                                        <div className='col-lg-2'>
                                                            <label className='mt-30'>City</label>
                                                        </div>
                                                        <div className='col-lg-10'>
                                                            <input className="form-control mt-30" type="text"value={user.employee?.city} onChange={handleChange} name="employee.city"/>
                                                            {renderError('city')}   
                                                        </div>
                                                    </div>
                                        
                                                    <div className='row'>
                                                        <div className='col-lg-2'>
                                                            <label className='mt-30'>Pincode</label>
                                                        </div>
                                                        <div className='col-lg-10'>
                                                            <input className="form-control mt-30" type="text"value={user.employee?.pincode} onChange={handleChange} name="employee.pincode"/>  
                                                        </div>
                                                    </div>
                                        
                                                    <div className='row'>
                                                        <div className='col-lg-2'>
                                                            <label className='mt-30'>Gender</label>
                                                        </div>
                                                        <div className='col-lg-10'>
                                                            <select className='form-control mt-30'  onChange={handleChange} name="employee.gender" value={user.employee?.gender}>
                                                                <option value="">Select Gender</option>
                                                                <option value="Male">Male</option>
                                                                <option value="Female">Female</option>
                                                                <option value="Other">Other</option>
                                                            </select>
                                                            {renderError('gender')} 
                                                        </div>
                                                    </div>
                                                    <div className="row">
                                                        <div className='col-lg-5'></div>
                                                        <div className='col-lg-5'>
                                                            <button type='submit' class="genric-btn success-border radius mt-30">Update</button>
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
                                
                </main>) : (
                    <p></p> 
            )}
        </>
    )
}
export default EmployeeEditProfile