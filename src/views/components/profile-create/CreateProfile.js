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

            {/* <!-- Hero Area Start--> */}
            <div class="slider-area ">
                <div class="single-slider section-overly slider-height2 d-flex align-items-center" style={{ backgroundImage: `url(assets/img/hero/about.jpg)` }}>
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="hero-cap text-center">
                                    <h2>Create Your Profile</h2>
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
                             <h4>Create Profile</h4>
                       </div>
                        {/* <!-- Select job items start --> */}
                        <div class="select-job-items2">
                            <select onClick={(e) => handleProfileChange(e.target.value)} className="form-control" name="select">
                                <option value="">All Category</option>
                                <option value="1">Employee</option>
                                <option value="2">Employer</option>
                            </select>
                            <div class="row">
                                <div className='col-lg-5'></div>
                                <div className='col-lg-5'>
                                <button  onClick={handleSubmit} className="btn head-btn2 mt-50">Submit</button>
                                </div>
                            </div>
                            
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
export default CreateProfile