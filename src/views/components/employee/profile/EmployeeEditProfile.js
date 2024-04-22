
import { BrowserRouter as Router, Switch, Route, Link, NavLink,useNavigate } from 'react-router-dom';
import React,{ useEffect, useState } from 'react';
import {getCountry,updateEmployeeProfile ,getState,getCity} from '../../../../apiService';

const EmployeeEditProfile = ({user,setUser})=>{
    const navigate = useNavigate()
    const [selectedImage, setSelectedImage] = useState(null);
    const [countryName, setcountryName] = useState(['']);
     const [countryId, setCountryId] = useState();
    // const [stateid, setstateid] = useState();
    const [stateName, setstateName] = useState([]);
    const [cityName, setcityName] = useState([]);

    
    useEffect(() => {
        getCountry()
            .then((response) => {
                console.log(response, 'Country Name');
                setcountryName(response.data);
            })
            .catch((error) => {
                console.error('Error fetching countries:', error);
            
    });
});
        // const hendelChange = (event) => {
        //         const getcontryid = event.target.value;
        //         setCountryId(getcontryid);
        // }


    useEffect(() => {
        getState(countryId)
            .then((response) => {
                console.log(response, 'State Name');
                setstateName(response.data);
            })
           
},[countryId]);
    useEffect(() => {
        getCity()
            .then((response) => {
                console.log(response, 'City Name');
                setcityName(response.data);
            })
            .catch((error) => {
                console.error('Error fetching cities:', error);
            
    });
    });
    
   
    
    // const handleState = (e) => {
    //     // const stateId = e.target.value;
    //     // fetchCities(stateId);
    // };
    
    const handleChange = (e) => {
        const { name, value } = e.target;
    
        // If the field is within the employee object
        if (name.startsWith('employee.')) {
            // Extract the nested field name (after 'employee.')
            const employeeField = name.split('.')[1];
    
            // Update the user state with nested field updated
            setUser((prevUser) => ({
                ...prevUser,
                employee: {
                    ...prevUser.employee,
                    [employeeField]: value
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
                navigate('/employee-profile');
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
                        <h2>Update Your Profile</h2>
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
                    <input className="form-control mt-30" type="number"value={user.employee?.phone} onChange={handleChange} name="employee.phone"/>
                </div>

                <div className='col-lg-2'>
                    <label className='mt-30'>Current Address</label>
                </div>
                <div className='col-lg-10'>
                    <input className="form-control mt-30" type="text"value={user.employee?.current_address} onChange={handleChange} name="employee.current_address"/>  
                </div>

                <div className='col-lg-2'>
                    <label className='mt-30'>Permanent Address</label>
                </div>
                <div className='col-lg-10'>
                    <input className="form-control mt-30" type="text"value={user.employee?.permanent_address} onChange={handleChange} name="employee.permanent_address"/>  
                </div>
                <div className='col-lg-2'>
                    <label className='mt-30'>Aadhar Number</label>
                </div>
                <div className='col-lg-10'>
                    <input className="form-control mt-30" type="text"value={user.employee?.adhar_card_no} onChange={handleChange} name="employee.adhar_card_no"/>  
                </div>

                <div className='col-lg-2'>
                    <label className='mt-30'>Qualification</label>
                </div>
                <div className='col-lg-10'>
                    <input className="form-control mt-30" type="text"value={user.employee?.qualification} onChange={handleChange} name="employee.qualification"/>  
                </div>

                <div className='col-lg-2'>
                    <label className='mt-30'>Certifications</label>
                </div>
                <div className='col-lg-10'>
                    <input className="form-control mt-30" type="text"value={user.employee?.certifications} onChange={handleChange} name="employee.certifications"/>  
                </div>

                <div className='col-lg-2'>
                    <label className='mt-30'>Skills</label>
                </div>
                <div className='col-lg-10'>
                    <input className="form-control mt-30" type="text"value={user.employee?.skills} onChange={handleChange} name="employee.skills"/>  
                </div>

                <div className='col-lg-2'>
                    <label className='mt-30'>Working From</label>
                </div>
                <div className='col-lg-10'>
                    <input className="form-control mt-30" type="text"value={user.employee?.working_from} onChange={handleChange} name="employee.working_from"/>  
                </div>

                <div className='col-lg-2'>
                    <label className='mt-30'>Work Experience</label>
                </div>
                <div className='col-lg-10'>
                    <input className="form-control mt-30" type="text"value={user.employee?.work_experience} onChange={handleChange} name="employee.work_experience"/>  
                </div>

                <div className='col-lg-2'>
                    <label className='mt-30'>Current working skill</label>
                </div>
                <div className='col-lg-10'>
                    <input className="form-control mt-30" type="text"value={user.employee?.current_working_skill} onChange={handleChange} name="employee.current_working_skill"/>  
                </div>

                <div className='col-lg-2'>
                    <label className='mt-30'>Languages</label>
                </div>
                <div className='col-lg-10'>
                    <input className="form-control mt-30" type="text"value={user.employee?.languages} onChange={handleChange} name="employee.languages"/>  
                </div>

                <div className='col-lg-2'>
                    <label className='mt-30'>Hobbies</label>
                </div>
                <div className='col-lg-10'>
                    <input className="form-control mt-30" type="text"value={user.employee?.hobbies} onChange={handleChange} name="employee.hobbies"/>  
                </div>

                <div className='col-lg-2'>
                    <label className='mt-30'>country</label>
                </div>
                <div className='col-lg-10'>
                     <select className='form-control mt-30' name="employee.country" onChange={handleChange}  value={user.employee?.country}>
                        <option value="">Select country</option>
                        {countryName && countryName.map((country, index) => (
                            <option key={index} value={country.id} >{country.name}</option>
                        ))}
                    </select>
                </div>
                <div className='col-lg-2'>
                    <label className='mt-30'>State</label>
                </div>
                <div className='col-lg-10'>
                    <select className='form-control mt-30'  name="employee.state"onChange={handleChange} value={user.employee?.state}>
                        <option value="">Select state</option>
                        {stateName && stateName.map((state, index) => (
                        <option key={index} value={state.state_id}>{state.state_name}</option>
                        ))}
                    </select>
                </div>
                <div className='col-lg-2'>
                    <label className='mt-30'>City</label>
                </div>
                <div className='col-lg-10'>
                    <select className='form-control mt-30' onChange={handleChange} name="employee.city" value={user?.employee?.city || ''}>
                        <option value="">Select City</option>
                        {cityName && cityName.map((city, index) => (
                        <option key={index} value={city.city_name}>{city.city_name}</option>
                        ))}
                    </select>
                </div>

                <div className='col-lg-2'>
                    <label className='mt-30'>Pincode</label>
                </div>
                <div className='col-lg-10'>
                    <input className="form-control mt-30" type="text"value={user.employee?.pincode} onChange={handleChange} name="employee.pincode"/>  
                </div>
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
                </div>

            
                </div>
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
    <p></p> 
)}
        </>
    )
}
export default EmployeeEditProfile