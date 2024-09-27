
import { useNavigate } from 'react-router-dom';
import React,{ useState } from 'react';
import {updateEmployeeProfile } from '../../../../apiService';
import DynamicForm from './projects_file';
import CertificatesFile from './CertificatesFile';

const EmployeeEditProfile = ({user,setUser})=>{

    const navigate = useNavigate()
    const [errors, setErrors] = useState({});

    // Project File Code
    
    const [inputs, setInputs] = useState([
        { id: Date.now(), projectName: '', briefDescription: '', roleAndContributions: '', technologiesUsed: '' }
    ]);

    const handleInputChange = (id, event) => {
        const { name, value } = event.target;
        setInputs(inputs.map(input => 
            input.id === id ? { ...input, [name]: value } : input
        ));
    };

    const addInputField = () => {
        setInputs([...inputs, { id: Date.now(), projectName: '', briefDescription: '', roleAndContributions: '', technologiesUsed: '' }]);
    };

    const removeInputField = (id) => {
        setInputs(inputs.filter(input => input.id !== id));
    };


    // Project File Code 
    
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

        const requiredFields = ['phone', 'current_address', 'qualification', 'skills', 'marriage_status', 'current_working_skill', 'languages','country', 'state', 'city', 'gender', 'marriage_status', 'permanent_address', 'working_from', 'work_experience', 'company_name',  'Degree', 'responsibilities_and_achievements', 'coursework_or_academic_achievements','university_or_collegeName', 'graduation_date', 'dates_of_employment', 'location', 'job_title', 'professional_summary', 'linkedIn_profile', 'proficiency_level_of_language', 'References' ];
        const formatErrors = {};

        requiredFields.forEach(field => {
            if (!user.employee?.[field]) 
            {
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
        if (user.employee?.marriage_status) formData.append('marriage_status', user.employee?.marriage_status);
        if (user.employee?.company_name) formData.append('company_name', user.employee?.company_name);
        if (user.employee?.responsibilities_and_achievements) formData.append('responsibilities_and_achievements', user.employee?.responsibilities_and_achievements);
        if (user.employee?.Degree) formData.append('Degree', user.employee?.Degree);
        if (user.employee?.university_or_collegeName) formData.append('university_or_collegeName', user.employee?.university_or_collegeName);
        if (user.employee?.graduation_date) formData.append('graduation_date', user.employee?.graduation_date);
        if (user.employee?.coursework_or_academic_achievements) formData.append('coursework_or_academic_achievements', user.employee?.coursework_or_academic_achievements);
        if (user.employee?.dates_of_employment) formData.append('dates_of_employment', user.employee?.dates_of_employment);
        if (user.employee?.location) formData.append('location', user.employee?.location);
        if (user.employee?.job_title) formData.append('job_title', user.employee?.job_title);
        if (user.employee?.professional_summary) formData.append('professional_summary', user.employee?.professional_summary);
        if (user.employee?.linkedIn_profile) formData.append('linkedIn_profile', user.employee?.linkedIn_profile);
        if (user.employee?.proficiency_level_of_language) formData.append('proficiency_level_of_language', user.employee?.proficiency_level_of_language);
        if (user.employee?.References) formData.append('References', user.employee?.References);
        if (user.employee?.certifications) formData.append('certifications', user.employee?.certifications);
        

        const payload = inputs.map(input => ({
            projectName: input.projectName,
            briefDescription: input.briefDescription,
            roleAndContributions: input.roleAndContributions,
            technologiesUsed: input.technologiesUsed
        }));

        const result = inputs.map(input => ({
            certificate_name: input.certificate_name,
            date_of_certification: input.date_of_certification,
            issuing_organization: input.issuing_organization,
        }));

        // Send data to the API

        for (const key in formData) {
            if (formData.hasOwnProperty(key)) {
                formData.append(key, formData[key]);
            }
        }

        // Append payload as a JSON string to formData
        formData.append('payload', JSON.stringify(payload));
     
        console.log('Response:', payload);

        formData.append('result', JSON.stringify(result));
     
        console.log('result:', result);
    
        
        updateEmployeeProfile(formData)
              .then((response) => {
                setUser(response.data);
                console.log(response.data,"Update Employee Profile")
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
                                                        <label className='mt-30 col-lg-2'>Name</label>
                                                        <input className="form-control mt-30 col-lg-8" type="text" value={user.name} onChange={handleChange} name="name"/>
                                                    </div>
                                    
                                                    <div className='row'>
                                                        <label className='mt-30 col-lg-2'>Email</label>
                                                        <input className="form-control mt-30 col-lg-8" type="text" value={user.email} onChange={handleChange} name="email"/>
                                                        {renderError('email')}
                                                    </div >
                                    
                                                    <div className='row'>
                                                        <label className='mt-30 col-lg-2'>Mobile Number</label>
                                                        <input className="form-control mt-30 col-lg-8" type="number"value={user.employee?.phone} onChange={handleChange} name="employee.phone"/>
                                                        {renderError('phone')}
                                                    </div>
                                    
                                                    <div className='row'>
                                                        <label className='mt-30 col-lg-2'>Current Address</label>
                                                        <input className="form-control mt-30 col-lg-8" type="text"value={user.employee?.current_address} onChange={handleChange} name="employee.current_address"/>
                                                        {renderError('current_address')}  
                                                    </div>
                                        
                                                    <div className='row'>
                                                        <label className='mt-30 col-lg-2'>Permanent Address</label>
                                                        <input className="form-control mt-30 col-lg-8" type="text"value={user.employee?.permanent_address} onChange={handleChange} name="employee.permanent_address"/>
                                                        {renderError('permanent_address')}  
                                                    </div>
                                        
                                                    <div className='row'>    
                                                        <label className='mt-30 col-lg-2'>Aadhar Number</label>
                                                        <input className="form-control mt-30 col-lg-8" type="text"value={user.employee?.adhar_card_no} onChange={handleChange} name="employee.adhar_card_no"/>
                                                    </div>
                                        
                                                    <div className='row'>
                                                        <label className='mt-30 col-lg-2'>Qualification</label>
                                                        <input className="form-control mt-30 col-lg-8" type="text"value={user.employee?.qualification} onChange={handleChange} name="employee.qualification"/>
                                                        {renderError('qualification')} 
                                                    </div>
                                        
                                                    <div className='row'>
                                                        <label className='mt-30 col-lg-2'>Certifications</label>
                                                        <input className="form-control mt-30 col-lg-8" type="text"value={user.employee?.certifications} onChange={handleChange} name="employee.certifications"/>
                                                        {renderError('certifications')}    
                                                    </div>
                                        
                                                    <div className='row'>
                                                        <label className='mt-30 col-lg-2'>Skills</label>
                                                        <input className="form-control mt-30 col-lg-8" type="text"value={user.employee?.skills} onChange={handleChange} name="employee.skills"/>
                                                        {renderError('skills')}   
                                                    </div>
                                        
                                                    <div className='row'>
                                                        <label className='mt-30 col-lg-2'>Working From</label>
                                                        <input className="form-control mt-30 col-lg-8" type="text"value={user.employee?.working_from} onChange={handleChange} name="employee.working_from"/>
                                                        {renderError('working_from')}   
                                                    </div>
                                        
                                                    <div className='row'>
                                                        <label className='mt-30 col-lg-2'>Work Experience</label>
                                                        <input className="form-control mt-30 col-lg-8" type="text"value={user.employee?.work_experience} onChange={handleChange} name="employee.work_experience"/>
                                                        {renderError('work_experience')}   
                                                    </div>
                                    
                                                    <div className='row'>
                                                        <label className='mt-30 col-lg-2'>Current working skill</label>
                                                        <input className="form-control mt-30 col-lg-8" type="text"value={user.employee?.current_working_skill} onChange={handleChange} name="employee.current_working_skill"/> 
                                                        {renderError('current_working_skill')} 
                                                    </div>
                                        
                                                    <div className='row'>
                                                        <label className='mt-30 col-lg-2'>Languages</label>
                                                        <input className="form-control mt-30 col-lg-8" type="text"value={user.employee?.languages} onChange={handleChange} name="employee.languages"/>
                                                        {renderError('languages')}  
                                                    </div>
                                        
                                                    <div className='row'>
                                                        <label className='mt-30 col-lg-2'>Hobbies</label>
                                                        <input className="form-control mt-30 col-lg-8" type="text"value={user.employee?.hobbies} onChange={handleChange} name="employee.hobbies"/>
                                                        {renderError('hobbies')}   
                                                    </div>
                                        
                                                    <div className='row'>
                                                        <label className='mt-30 col-lg-2'>country</label>
                                                        <input className="form-control mt-30 col-lg-8" type="text"value={user.employee?.country} onChange={handleChange} name="employee.country"/>
                                                        {renderError('country')}   
                                                    </div>
                                        
                                                    <div className='row'>
                                                        <label className='mt-30 col-lg-2'>State</label>
                                                        <input className="form-control mt-30 col-lg-8" type="text"value={user.employee?.state} onChange={handleChange} name="employee.state"/>
                                                        {renderError('state')}   
                                                    </div>
                                        
                                                    <div className='row'>
                                                        <label className='mt-30 col-lg-2'>City</label>
                                                        <input className="form-control mt-30 col-lg-8" type="text"value={user.employee?.city} onChange={handleChange} name="employee.city"/>
                                                        {renderError('city')}   
                                                    </div>
                                        
                                                    <div className='row'>
                                                        <label className='mt-30 col-lg-2'>Pincode</label>
                                                        <input className="form-control mt-30 col-lg-8" type="text"value={user.employee?.pincode} onChange={handleChange} name="employee.pincode"/>
                                                        {renderError('pincode')} 
                                                    </div>
                                        
                                                    <div className='row'>
                                                        <label className='mt-30 col-lg-2'>Gender</label>
                                                        <select className="form-control mt-30 col-lg-8"  onChange={handleChange} name="employee.gender" value={user.employee?.gender}>
                                                            <option value="">Select Gender</option>
                                                            <option value="Male">Male</option>
                                                            <option value="Female">Female</option>
                                                            <option value="Other">Other</option>
                                                        </select>
                                                        {renderError('gender')} 
                                                    </div>

                                                    
                                        
                                                    <div className='row'>
                                                        <label className='mt-30 col-lg-2'>Marital status</label>
                                                        <select className="form-control mt-30 col-lg-8" type="text" value={user.employee?.marriage_status} onChange={handleChange} name="employee.marriage_status">
                                                            <option value="">Select Marital Status</option>
                                                            <option value="married">Married</option>
                                                            <option value="unmarried">UnMarried</option>
                                                        </select>
                                                        {renderError('marriage_status')}  
                                                    </div>
                                    
                                                    <div className='row'>
                                                        <label className='mt-30 col-lg-2'>Company Name</label>
                                                        <input className="form-control mt-30 col-lg-8" type="text" value={user.employee?.company_name} onChange={handleChange} name="employee.company_name"/>
                                                        {renderError('company_name')}
                                                    </div>
                                    
                                                    <div className='row'>
                                                        <label className='mt-30 col-lg-2'>Responsibilities and Achievements</label>
                                                        <input className="form-control mt-30 col-lg-8" type="text" value={user.employee?.responsibilities_and_achievements} onChange={handleChange} name="employee.responsibilities_and_achievements"/>
                                                        {renderError('responsibilities_and_achievements')}
                                                    </div >
                                    
                                                    <div className='row'>
                                                        <label className='mt-30 col-lg-2'>Degree</label>
                                                        <input className="form-control mt-30 col-lg-8" type="text"value={user.employee?.Degree} onChange={handleChange} name="employee.Degree"/>
                                                        {renderError('Degree')}
                                                    </div>
                                    
                                                    <div className='row'>
                                                        <label className='mt-30 col-lg-2'>University or College Name</label>
                                                        <input className="form-control mt-30 col-lg-8" type="text"value={user.employee?.university_or_collegeName} onChange={handleChange} name="employee.university_or_collegeName"/>
                                                        {renderError('university_or_collegeName')}  
                                                    </div>
                                        
                                                    <div className='row'>
                                                        <label className='mt-30 col-lg-2'>Graduation Date</label>
                                                        <input className="form-control mt-30 col-lg-8" type="date"value={user.employee?.graduation_date} onChange={handleChange} name="employee.graduation_date"/>
                                                        {renderError('graduation_date')}  
                                                    </div> 
                                        
                                                    <div className='row'>    
                                                        <label className='mt-30 col-lg-2'>Coursework or Academic Achievements</label>
                                                        <input className="form-control mt-30 col-lg-8" type="text"value={user.employee?.coursework_or_academic_achievements} onChange={handleChange} name="employee.coursework_or_academic_achievements"/> 
                                                        {renderError('coursework_or_academic_achievements')}
                                                    </div>
                                                    <DynamicForm
                                                        inputs={inputs}
                                                        handleInputChange={handleInputChange}
                                                        addInputField={addInputField}
                                                        removeInputField={removeInputField}
                                                        handleSubmit={handleSubmit}
                                                    />

                                                    <CertificatesFile
                                                        inputs={inputs}
                                                        handleInputChange={handleInputChange}
                                                        addInputField={addInputField}
                                                        removeInputField={removeInputField}
                                                        handleSubmit={handleSubmit}
                                                    />
                                                   
                                        
                                                    <div className='row'>
                                                        <label className='mt-30 col-lg-2'>Dates of Employment</label>
                                                        <input className="form-control mt-30 col-lg-8" type="date"value={user.employee?.dates_of_employment} onChange={handleChange} name="employee.dates_of_employment"/>
                                                        {renderError('dates_of_employment')}   
                                                    </div>
                                    
                                                    <div className='row'>
                                                        <label className='mt-30 col-lg-2'>Location</label>
                                                        <input className="form-control mt-30 col-lg-8" type="text"value={user.employee?.location} onChange={handleChange} name="employee.location"/> 
                                                        {renderError('location')} 
                                                    </div>
                                        
                                                    <div className='row'>
                                                        <label className='mt-30 col-lg-2'>Job Title</label>
                                                        <input className="form-control mt-30 col-lg-8" type="text"value={user.employee?.job_title} onChange={handleChange} name="employee.job_title"/>
                                                        {renderError('job_title')}  
                                                    </div>
                                        
                                                    <div className='row'>
                                                        <label className='mt-30 col-lg-2'>Professional Summary</label>
                                                        <input className="form-control mt-30 col-lg-8" type="text"value={user.employee?.professional_summary} onChange={handleChange} name="employee.professional_summary"/> 
                                                        {renderError('professional_summary')}  
                                                    </div>
                                        
                                                    <div className='row'>
                                                        <label className='mt-30 col-lg-2'>LinkedIn Profile</label>
                                                        <input className="form-control mt-30 col-lg-8" type="text"value={user.employee?.linkedIn_profile} onChange={handleChange} name="employee.linkedIn_profile"/>
                                                        {renderError('linkedIn_profile')}      
                                                    </div>
                                        
                                                    <div className='row'>
                                                        <label className='mt-30 col-lg-2'>Proficiency Level of Language</label>
                                                        <input className="form-control mt-30 col-lg-8" type="text"value={user.employee?.proficiency_level_of_language} onChange={handleChange} name="employee.proficiency_level_of_language"/>
                                                        {renderError('proficiency_level_of_language')}   
                                                    </div>
                                        
                                                    <div className='row'>
                                                        <label className='mt-30 col-lg-2'>References</label>
                                                        <input className="form-control mt-30 col-lg-8" type="text"value={user.employee?.References} onChange={handleChange} name="employee.References"/>
                                                        {renderError('References')}   
                                                    </div>


                                                    <div className="row">
                                                        <div className='col-lg-5'></div>
                                                        <div className='col-lg-2'>
                                                            <button type='submit' class="genric-btn success-border radius mt-30">Update</button>
                                                        </div>
                                                        <div className='col-lg-5'></div>
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