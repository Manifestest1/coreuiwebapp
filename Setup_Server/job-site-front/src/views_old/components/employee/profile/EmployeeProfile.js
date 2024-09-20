import { BrowserRouter as Router, Switch, Route, Link, useNavigate } from 'react-router-dom';
import React, { useEffect, useState, useRef } from 'react';
import { updateUserProfile,employeePdfDownload } from '../../../../apiService';

const EmployeeProfile = ({ user, setUser }) => {
    const [imageFile, setImageFile] = useState(null);
    const [imagePreview, setImagePreview] = useState(null);
    const imageInputRef = useRef(null);
    const navigate = useNavigate();
    
    const handleImageUpdate = () => {
        if (imageInputRef.current) {
            imageInputRef.current.click();
        };
    };
    const handleImageChange = (e) => {
        const file = e.target.files[0];
        if (file) {
            setImageFile(file);
            const reader = new FileReader();
            reader.onloadend = () => {
                setImagePreview(reader.result);
            };
            reader.readAsDataURL(file);
            updateUserImage(file);
        }
    };

    const updateUserImage = async (file) => {
        try {
            const formData = new FormData();
            formData.append('imageurl', file);
            const response = await updateUserProfile(formData);
            setUser(response.data);
            console.warn('Image updated successfully', response.data);
        } catch (error) {
            console.error('Error updating image', error);
        }
    };

    const downloadPDF = (userId) => {
        console.log(userId,"Get Userid");

      fetch('https://staging.fyies.com/jobsite/backend/api/auth/employee-download-pdf/'+userId)
     .then(response => response.blob())
     .then(blob => {
       const url = window.URL.createObjectURL(new Blob([blob]));
       const link = document.createElement('a');
       link.href = url;
       link.setAttribute('download', 'file.pdf');
       document.body.appendChild(link);
       link.click();
       link.parentNode.removeChild(link);
     })
     .catch(error => console.error('Error downloading file:', error));

    };

    const handleEditProfileClick = () => {
        navigate('/employee-edit-profile');
    };

    return(
        <>
            {user ? (
                    <main>
                        <div class="slider-area ">
                            <div class="single-slider section-overly slider-height2 d-flex align-items-center"  style={{ backgroundImage: `url(assets/img/hero/about.jpg)` }}>
                                <div class="container">
                                    <div class="row">
                                        <div class="col-xl-12">
                                            <div class="hero-cap text-center">
                                                <h2>Employee Profile</h2>
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
                                                    <div className='row'>
                                                        <div className='col-lg-8'></div>
                                                        <div className='col-lg-2'>
                                                        <button onClick={() => downloadPDF(user.id)} class="genric-btn success-border radius">Download PDF</button>
                                                        </div>
                                                        <div className='col-lg-2'>
                                                           <button id='edit-employee-button' onClick={handleEditProfileClick} class="genric-btn success-border radius">Edit Profile</button>
                                                        </div>
                                                    </div>
                                                    <div className='row'>   
                                                        <div className='col-lg-12' id='employee-img' >
                                                            <input id="image-input" type="file" accept="image/*" onChange={handleImageChange}  ref={imageInputRef} name="imageurl" />
                                                            {/* Image preview */}
                                                            {imagePreview ? (
                                                            <img id='img-Preview' src={imagePreview} alt="Preview"/>
                                                            ) : (
                                                                user.imagebaseurl? <img id='img-baseurl' src={user.imagebaseurl + user?.imageurl} alt="User Profile Image" size="md" /> :<img id='img-url' src={user?.imageurl} alt="User Profile Image" size="md" />
                                                            )}
                                                            {/* Button to replace input field */}
                                                            <button id='image-update' onClick={handleImageUpdate}><i class="fas fa-camera"></i></button>
                                                        </div>
                                                        <div className='col-lg-3 '>
                                                            <label className='mt-30'>Name</label>
                                                        </div>
                                                        <div className='col-lg-3'>
                                                           <label className='mt-30'>{user.name}</label>
                                                        </div>
                                                        <div className='col-lg-3 '>
                                                            <label className='mt-30'>Email</label>
                                                        </div>
                                                        <div className='col-lg-3'>
                                                            <label className='mt-30'>{user.email}</label>
                                                        </div>
                                                        <div className='col-lg-3 '>
                                                            <label className='mt-30'>Mobile Number</label>
                                                        </div>
                                                        <div className='col-lg-3'>
                                                            <label className='mt-30'>{user.employee?.phone}</label> 
                                                        </div>
                                                        <div className='col-lg-3 '>
                                                            <label className='mt-30'>Current Address</label>
                                                        </div>
                                                        <div className='col-lg-3'>
                                                            <label className='mt-30'>{user.employee?.current_address}</label> 
                                                        </div>
                                                        <div className='col-lg-3 '>
                                                            <label className='mt-30'>Permanent Address</label>
                                                        </div>
                                                        <div className='col-lg-3'>
                                                            <label className='mt-30'>{user.employee?.permanent_address}</label>   
                                                        </div>
                                                        <div className='col-lg-3 '>
                                                            <label className='mt-30'>Aadhar Number</label>
                                                        </div>
                                                        <div className='col-lg-3'>
                                                            <label className='mt-30'>{user.employee?.adhar_card_no}</label>  
                                                        </div>
                                                        <div className='col-lg-3 '>
                                                            <label className='mt-30'>Qualification</label>
                                                        </div>
                                                        <div className='col-lg-3 '>
                                                            <label className='mt-30'>{user.employee?.qualification}</label>  
                                                        </div>
                                                        <div className='col-lg-3 '>
                                                            <label className='mt-30'>Certifications</label>
                                                        </div>
                                                        <div className='col-lg-3'>
                                                            <label className='mt-30'>{user.employee?.certifications}</label> 
                                                        </div>
                                                        <div className='col-lg-3 '>
                                                            <label className='mt-30'>Skills</label>
                                                        </div>
                                                        <div className='col-lg-3'>
                                                            <label className='mt-30'>{user.employee?.skills}</label> 
                                                        </div>
                                                        <div className='col-lg-3 '>
                                                            <label className='mt-30'>Working From</label>
                                                        </div>
                                                        <div className='col-lg-3'>
                                                            <label className='mt-30'>{user.employee?.working_from}</label>  
                                                        </div>
                                                        <div className='col-lg-3 '>
                                                            <label className='mt-30'>Work Experience</label>
                                                        </div>
                                                        <div className='col-lg-3'>
                                                            <label className='mt-30'>{user.employee?.work_experience}</label> 
                                                        </div>
                                                        <div className='col-lg-3 '>
                                                            <label className='mt-30'>Current working skill</label>
                                                        </div>
                                                        <div className='col-lg-3'>
                                                            <label className='mt-30'>{user.employee?.current_working_skill}</label> 
                                                        </div>
                                                        <div className='col-lg-3 '>
                                                            <label className='mt-30'>Languages</label>
                                                        </div>
                                                        <div className='col-lg-3'>
                                                            <label className='mt-30'>{user.employee?.languages}</label> 
                                                        </div>
                                                        <div className='col-lg-3 '>
                                                            <label className='mt-30'>Hobbies</label>
                                                        </div>
                                                        <div className='col-lg-3'>
                                                            <label className='mt-30'>{user.employee?.hobbies}</label> 
                                                        </div>
                                                        <div className='col-lg-3 '>
                                                            <label className='mt-30'>Country</label>
                                                        </div>
                                                        <div className='col-lg-3'>
                                                            <label className='mt-30'>{user.employee?.country}</label> 
                                                        </div>
                                                        <div className='col-lg-3 '>
                                                            <label className='mt-30'>State</label>
                                                        </div>
                                                        <div className='col-lg-3'>
                                                            <label className='mt-30'>{user.employee?.state}</label> 
                                                        </div>
                                                        <div className='col-lg-3 '>
                                                            <label className='mt-30'>City</label>
                                                        </div>
                                                        <div className='col-lg-3'>
                                                            <label className='mt-30'>{user.employee?.city}</label>   
                                                        </div>
                                                        <div className='col-lg-3 '>
                                                            <label className='mt-30'>Pincode</label>
                                                        </div>
                                                        <div className='col-lg-3'>
                                                            <label className='mt-30'>{user.employee?.pincode}</label>  
                                                        </div>
                                                        <div className='col-lg-3 '>
                                                            <label className='mt-30'>Gender</label>
                                                        </div>
                                                        <div className='col-lg-3'>
                                                            <label className='mt-30'>{user.employee?.gender}</label>  
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
                ) : (
                    <p></p> 
                )}
            </>
        )
    }
export default EmployeeProfile