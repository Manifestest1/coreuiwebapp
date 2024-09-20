import { BrowserRouter as Router, Switch, Route, Link, NavLink, useNavigate } from 'react-router-dom';
import React,{ useEffect, useState } from 'react';
import {updateUserProfile} from '../../../../apiService';

const EmployerProfile = ({user,setUser}) => {

    const [imageFile, setImageFile] = useState(null);
    const [imagePreview, setImagePreview] = useState(null);
    const navigate = useNavigate();

     const handleImageUpdate = () => {
        document.getElementById('imageInput').click();
    };
  
    const handleImageChange = (e) => {
      const file = e.target.files[0];
      if (file) 
      {
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
          // Send the updated image to the API
          const response = await updateUserProfile(formData);
          setUser(response.data);
          console.warn('Image updated successfully', response.data);
        } catch (error) {
          console.error('Error updating image', error);
        }
      };

      const handleEditProfileClick = () => {
        navigate('/employer-edit-profile');
    };

    return(
        <>
            {user ? (
                <main>
                    <div class="slider-area ">
                        <div class="single-slider section-overly slider-height2 d-flex align-items-center single-slider-contact">
                            <div class="container">
                                <div class="row">
                                    <div class="col-xl-12">
                                        <div class="hero-cap text-center">
                                            <h2>Employer Profile</h2>
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
                                                    <div className='col-lg-10' id='category-listing'>
                                                        <div className='row' id='category-listing-1'>
                                                            <div className='col-lg-12'>
                                                                <input id="imageInput" type="file" accept="image/*" onChange={handleImageChange} style={{ display: 'none' }} name="imageurl" />
                                                                {imagePreview ? (
                                                                    <img id='employer-preview'  src={imagePreview} alt="Preview"/>
                                                                ) : (
                                                                    user.imagebaseurl? <img id='employer-preview-1'  src={user.imagebaseurl + user?.imageurl} alt="User Profile Image" size="md" /> :<img style={{height:'150px',width:'150px',borderRadius:'50%'}} src={user?.imageurl} alt="User Profile Image" size="md" />
                                                                )}
                                                            </div>
                                                            <button id='employer-preview-2'  onClick={handleImageUpdate}><i class="fas fa-camera"></i></button>    
                                                        </div>
                                                    </div>
                                                    <div className='col-lg-2'>
                                                       <button id='edit-employee-button' onClick={handleEditProfileClick} class="genric-btn success-border radius">Edit Profile</button>
                                                    </div>
                                                    <div className='col-lg-6 label-customcss'>
                                                       <label className='mt-30'>Name</label>
                                                       <label className='mt-30 margen'>{user.name}</label>
                                                    </div>
                                                    <div className='col-lg-6 label-customcss'>
                                                        <label className='mt-30'>Email</label>
                                                        <label className='mt-30 margen'>{user.email}</label>
                                                    </div>
                                                    <div className='col-lg-6 label-customcss'>
                                                        <label className='mt-30'>Mobile Number</label>
                                                        <label className='mt-30 margen'>{user.employer?.phone}</label> 
                                                    </div>
                                                    <div className='col-lg-6 label-customcss'>
                                                        <label className='mt-30'>Current Address</label>
                                                        <label className='mt-30 margen'>{user.employer?.current_address}</label> 
                                                    </div>
                                                    <div className='col-lg-6 label-customcss'>
                                                        <label className='mt-30'>Permanent Address</label>
                                                        <label className='mt-30 margen'>{user.employer?.permanent_address}</label>   
                                                    </div>
                                                    <div className='col-lg-6 label-customcss'>
                                                        <label className='mt-30'>Aadhar Number</label>
                                                        <label className='mt-30 margen'>{user.employer?.adhar_card_no}</label>  
                                                    </div>
                                                    <div className='col-lg-6 label-customcss'>
                                                        <label className='mt-30'>Qualification</label>
                                                        <label className='mt-30 margen'>{user.employer?.qualification}</label>  
                                                    </div>
                                                    <div className='col-lg-6 label-customcss'>
                                                        <label className='mt-30'>Certifications</label>
                                                        <label className='mt-30 margen'>{user.employer?.certifications}</label> 
                                                    </div>
                                                    <div className='col-lg-6 label-customcss'>
                                                        <label className='mt-30'>Skills</label>
                                                        <label className='mt-30 margen'>{user.employer?.skills}</label> 
                                                    </div>
                                                    <div className='col-lg-6 label-customcss'>
                                                        <label className='mt-30'>Working From</label>
                                                        <label className='mt-30 margen'>{user.employer?.working_from}</label>  
                                                    </div>
                                                    <div className='col-lg-6 label-customcss'>
                                                        <label className='mt-30'>Work Experience</label>
                                                        <label className='mt-30 margen'>{user.employer?.work_experience}</label> 
                                                    </div>
                                                    <div className='col-lg-6 label-customcss'>
                                                        <label className='mt-30'>Current working skill</label>
                                                        <label className='mt-30 margen'>{user.employer?.current_working_skill}</label> 
                                                    </div>
                                                    <div className='col-lg-6 label-customcss'>
                                                        <label className='mt-30'>Languages</label>
                                                        <label className='mt-30 margen'>{user.employer?.languages}</label> 
                                                    </div>
                                                    <div className='col-lg-6 label-customcss'>
                                                        <label className='mt-30'>Hobbies</label>
                                                        <label className='mt-30 margen'>{user.employer?.hobbies}</label> 
                                                    </div>
                                                    <div className='col-lg-6 label-customcss'>
                                                        <label className='mt-30'>Country</label>
                                                        <label className='mt-30 margen'>{user.employer?.country}</label> 
                                                    </div>
                                                    <div className='col-lg-6 label-customcss'>
                                                        <label className='mt-30'>State</label>
                                                        <label className='mt-30 margen'>{user.employer?.state}</label> 
                                                    </div>
                                                    <div className='col-lg-6 label-customcss'>
                                                        <label className='mt-30'>City</label>
                                                        <label className='mt-30 margen'>{user.employer?.city}</label>   
                                                    </div>
                                                    <div className='col-lg-6 label-customcss'>
                                                        <label className='mt-30'>Pincode</label>
                                                        <label className='mt-30 margen'>{user.employer?.pincode}</label>  
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
export default EmployerProfile