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
                                                    <div className='col-lg-6'>
                                                        <label className='mt-30'>
                                                            <span className='profilecolor'>Name:   </span>
                                                            <span>{user.name}</span>
                                                        </label>
                                                    </div>
                                                    <div className='col-lg-6'>
                                                        <label className='mt-30'>
                                                            <span className='profilecolor'>Email:   </span>
                                                            <span >{user.email}</span>
                                                        </label>
                                                    </div>
                                                    <div className='col-lg-6'>
                                                        <label className='mt-30'>
                                                            <span className='profilecolor'>Mobile Number:   </span>
                                                            <span >{user.employer?.phone}</span> 
                                                        </label>
                                                    </div>
                                                    <div className='col-lg-6'>
                                                        <label className='mt-30'>
                                                            <span className='profilecolor'>Current Address:   </span>
                                                            <span >{user.employer?.current_address}</span> 
                                                        </label>
                                                    </div>
                                                    <div className='col-lg-6'>
                                                        <label className='mt-30'>
                                                            <span className='profilecolor'>Permanent Address:   </span>
                                                            <span >{user.employer?.permanent_address}</span>
                                                        </label>
                                                    </div>
                                                    <div className='col-lg-6'>
                                                        <label className='mt-30'>
                                                            <span className='profilecolor'>Aadhar Number:   </span>
                                                            <span >{user.employer?.adhar_card_no}</span> 
                                                        </label> 
                                                    </div>
                                                    <div className='col-lg-6'>
                                                        <label className='mt-30'>
                                                            <span className='profilecolor'>Qualification:   </span>
                                                            <span >{user.employer?.qualification}</span>
                                                        </label>  
                                                    </div>
                                                    <div className='col-lg-6'>
                                                        <label className='mt-30'>
                                                            <span className='profilecolor'>Certifications:   </span>
                                                            <span >{user.employer?.certifications}</span> 
                                                        </label>
                                                    </div>
                                                    <div className='col-lg-6'>
                                                        <label className='mt-30'>
                                                            <span className='profilecolor'>Skills:   </span>
                                                            <span >{user.employer?.skills}</span> 
                                                        </label>
                                                    </div>
                                                    <div className='col-lg-6'>
                                                        <label className='mt-30'>
                                                            <span className='profilecolor'>Working From:   </span>
                                                            <span >{user.employer?.working_from}</span>
                                                        </label>  
                                                    </div>
                                                    <div className='col-lg-6'>
                                                        <label className='mt-30'>
                                                            <span className='profilecolor'>Work Experience:   </span>
                                                            <span >{user.employer?.work_experience}</span> 
                                                        </label>
                                                    </div>
                                                    <div className='col-lg-6'>
                                                        <label className='mt-30'>
                                                            <span className='profilecolor'>Current working skill:   </span>
                                                            <span >{user.employer?.current_working_skill}</span> 
                                                        </label>
                                                    </div>
                                                    <div className='col-lg-6'>
                                                        <label className='mt-30'>
                                                            <span className='profilecolor'>Languages:   </span>
                                                            <span >{user.employer?.languages}</span>
                                                        </label> 
                                                    </div>
                                                    <div className='col-lg-6'>
                                                        <label className='mt-30'>
                                                            <span className='profilecolor'>Hobbies:   </span>
                                                            <span >{user.employer?.hobbies}</span> 
                                                        </label>
                                                    </div>
                                                    <div className='col-lg-6'>
                                                        <label className='mt-30'>
                                                            <span className='profilecolor'>Country:   </span>
                                                            <span >{user.employer?.country}</span> 
                                                        </label>
                                                    </div>
                                                    <div className='col-lg-6'>
                                                        <label className='mt-30'>
                                                            <span className='profilecolor'>State:   </span>
                                                            <span >{user.employer?.state}</span> 
                                                        </label>
                                                    </div>
                                                    <div className='col-lg-6'>
                                                        <label className='mt-30'>
                                                            <span className='profilecolor'>City:   </span>
                                                            <span >{user.employer?.city}</span>
                                                        </label>   
                                                    </div>
                                                    <div className='col-lg-6'>
                                                        <label className='mt-30'>
                                                            <span className='profilecolor'>Pincode:   </span>
                                                            <span >{user.employer?.pincode}</span>
                                                        </label>  
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