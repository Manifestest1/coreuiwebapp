import { BrowserRouter as Router, Switch, Route, useParams, NavLink,useNavigate } from 'react-router-dom';
import React,{ useEffect, useState } from 'react';
import {getPublicEmployeeProfile} from '../../../../apiService'; 

const EmployeePublicProfile = ()=>{
    const navigate = useNavigate()
    const { userId } = useParams();
    const [user, setUser] = useState({})

    useEffect(() => {
        getPublicEmployeeProfile(userId)
        .then((r) => {
          setUser(r.data);
        })
        .catch((e) => {
            console.log(e)
        });
      }, []); // Empty dependency array to ensure the effect runs only once

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
                        <h2>Employee public Profile</h2>
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
    {/* <!-- Select job items start --> */}
    <div class="select-job-items2">
    <form>
   
    <div className='row'>
       
        <div className='col-lg-12' style={{textAlign:'center'}}>
           <img style={{height:'100px',width:'110px',borderRadius:'50%'}} src={user?.imageurl} alt="User Profile Image" size="md" />
        </div>
       
        
        <div className='col-lg-3'>
            <label className='mt-30 label-customcss'>Name</label>
        </div>
        <div className='col-lg-3'>
           <label className='mt-30'>{user.name}</label>
        </div>

        <div className='col-lg-3'>
            <label className='mt-30 label-customcss'>Email</label>
        </div>
        <div className='col-lg-3'>
            <label className='mt-30'>{user.email}</label>
        </div>

        <div className='col-lg-3'>
            <label className='mt-30 label-customcss'>Mobile Number</label>
        </div>
        <div className='col-lg-3'>
            <label className='mt-30'>{user.employee?.phone}</label> 
        </div>

        <div className='col-lg-3'>
            <label className='mt-30 label-customcss'>Current Address</label>
        </div>
        <div className='col-lg-3'>
            <label className='mt-30'>{user.employee?.current_address}</label> 
        </div>

        <div className='col-lg-3 label-customcss'>
            <label className='mt-30'>Permanent Address</label>
        </div>
        <div className='col-lg-3'>
            <label className='mt-30'>{user.employee?.permanent_address}</label>   
        </div>

        <div className='col-lg-3 label-customcss'>
            <label className='mt-30'>Aadhar Number</label>
        </div>
        <div className='col-lg-3'>
            <label className='mt-30'>{user.employee?.adhar_card_no}</label>  
        </div>

        <div className='col-lg-3 label-customcss'>
            <label className='mt-30'>Qualification</label>
        </div>
        <div className='col-lg-3'>
            <label className='mt-30'>{user.employee?.qualification}</label>  
        </div>

        <div className='col-lg-3 label-customcss'>
            <label className='mt-30'>Certifications</label>
        </div>
        <div className='col-lg-3'>
            <label className='mt-30'>{user.employee?.certifications}</label> 
        </div>

        <div className='col-lg-3 label-customcss'>
            <label className='mt-30'>Skills</label>
        </div>
        <div className='col-lg-3'>
            <label className='mt-30'>{user.employee?.skills}</label> 
        </div>

        <div className='col-lg-3 label-customcss'>
            <label className='mt-30'>Working From</label>
        </div>
        <div className='col-lg-3'>
            <label className='mt-30'>{user.employee?.working_from}</label>  
        </div>

        <div className='col-lg-3 label-customcss'>
            <label className='mt-30'>Work Experience</label>
        </div>
        <div className='col-lg-3'>
            <label className='mt-30'>{user.employee?.work_experience}</label> 
        </div>

        <div className='col-lg-3 label-customcss'>
            <label className='mt-30'>Current working skill</label>
        </div>
        <div className='col-lg-3'>
            <label className='mt-30'>{user.current_working_skill}</label> 
        </div>

        <div className='col-lg-3'>
            <label className='mt-30 label-customcss'>Languages</label>
        </div>
        <div className='col-lg-3'>
            <label className='mt-30'>{user.employee?.languages}</label> 
        </div>

        <div className='col-lg-3'>
            <label className='mt-30 label-customcss'>Hobbies</label>
        </div>
        <div className='col-lg-3'>
            <label className='mt-30'>{user.employee?.hobbies}</label> 
        </div>

        <div className='col-lg-3'>
            <label className='mt-30 label-customcss'>Country</label>
        </div>
        <div className='col-lg-3'>
            <label className='mt-30'>{user.employee?.country}</label> 
        </div>

        <div className='col-lg-3'>
            <label className='mt-30 label-customcss'>State</label>
        </div>
        <div className='col-lg-3'>
            <label className='mt-30'>{user.employee?.state}</label> 
        </div>

        <div className='col-lg-3'>
            <label className='mt-30 label-customcss'>City</label>
        </div>
        <div className='col-lg-3'>
            <label className='mt-30'>{user.employee?.city}</label>   
        </div>

        <div className='col-lg-3'>
            <label className='mt-30 label-customcss'>Pincode</label>
        </div>
        <div className='col-lg-3'>
            <label className='mt-30'>{user.employee?.pincode}</label>  
        </div>



    </div>
    {/* <input className="form-control mt-30" type="file" onChange={handleChange} name="imageurl" /> */}
    
        {/* <select className="form-control mt-30" name="select">
            <option value="">All Category</option>
            <option value="1">Employee</option>
            <option value="2">Employer</option>
        </select> */}
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

export default EmployeePublicProfile