import { BrowserRouter as Router, Switch, Route, Link, NavLink,useNavigate } from 'react-router-dom';
import React,{ useEffect, useState } from 'react';
import {createUserProfile} from '../../../apiService';

const CreateProfile = ({ setUser })=>{
    const [selectedProfile, setSelectedProfile] = useState('');  
    const navigate = useNavigate()
    const handleProfileChange = (value) => {
        setSelectedProfile(value);
        console.log(value,'User Profile'); 
    };
    const handleSubmit = async (e) => {
        e.preventDefault();
        try {
            const response = await createUserProfile(selectedProfile);
            setUser(response.data)
            if(response.data.role_id == 1)
            {
              console.log(response.data,'For Employee');
              navigate('/employee-dashboard');
            }
            else
            {
              console.log(response.data,'For Employer');
              navigate('/employer-dashboard');
            }
          
        } 
        catch (error) 
        {
           console.error('Error submitting data:', error);
        }
    }; 

    return(
        <>
            <main>
                <div class="slider-area ">
                    <div class="single-slider section-overly slider-height2 d-flex align-items-center single-slider-contact" >
                        <div class="container">
                            <div class="row">
                                <div class="col-xl-12">
                                    <div class="hero-cap text-center">
                                        <h2>Select Profile</h2>
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
                                    <div class="job-category-listing mb-50">
                                        <div class="single-listing">
                                           <div class="small-section-tittle2"> 
                                                 <h4>Select Profile</h4>
                                           </div>
                                            <div class="select-job-items2">
                                                <select onClick={(e) => handleProfileChange(e.target.value)} className="form-control" name="select">
                                                    <option value="1">Employee</option>
                                                    <option value="2">Employer</option>
                                                </select>
                                                <div class="row">
                                                    <div className='col-lg-5'></div>
                                                    <div className='col-lg-5'>
                                                    <button  onClick={handleSubmit} className="genric-btn success-border radius mt-30">Submit</button>
                                                    </div>
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
export default CreateProfile