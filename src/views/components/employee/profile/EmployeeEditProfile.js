
import { useNavigate } from 'react-router-dom';
import React, { useState, useEffect } from 'react';
import { updateEmployeeProfile } from '../../../../apiService';
import DynamicForm from './projects_file';
import CertificatesFile from './CertificatesFile';
import EducationForm from './EducationForm';
import ExperienceForm from './ExperienceForm';
import ImageUpload from './ImageUpload';

const EmployeeEditProfile = ({ user, setUser }) => {
  const navigate = useNavigate();
  const [errors, setErrors] = useState({});
  const [imagePreviews, setImagePreviews] = useState({});
  const [fileInputs, setFileInputs] = useState({});
  const [fileData, setFileData] = useState({});
  const [fileImage, setImageFile] = useState({});
  const baseURL = process.env.REACT_APP_API_URL; 

  const [inputs, setInputs] = useState([
    { id: Date.now(), project_name: '', brief_description: '', role_of_employee: '', technologies_used: '', company_image: '' }
  ]);

  const [eductionalInputs, setEductionalInputs] = useState([
    { id: Date.now(), institution_names: '', course: '', from_year: '', to_year: '', grading: '', description: '' }
  ]);

  const [experienceInputs, setExperienceInputs] = useState([
    { id: Date.now(), company_pic: '', company_name: '', role_of_employee: '', used_technology: '', working_from: '', working_to: '', location: '', responsibilities: '' }
  ]);

  const [certificatesInputs, setCertificatesInputs] = useState([
    { id: Date.now(), certificate_name: '', date_of_certification: '', issuing_organization: '', grade: '', description: '' }
  ]);

  useEffect(() => {
    if (user) {
      setInputs(user.projects || []);
      setEductionalInputs(user.education || []);
      setExperienceInputs(user.experience || []);
      setCertificatesInputs(user.certificates || []);
    }
  }, [user]);

  const handleInputChange = (id, event) => {
    const { name, value } = event.target;
    setInputs(inputs.map(input => (input.id === id ? { ...input, [name]: value } : input)));
  };

  const handleEductionalInputChange = (id, event) => {
    const { name, value } = event.target;
    setEductionalInputs(eductionalInputs.map(input => (input.id === id ? { ...input, [name]: value } : input)));
  };

  const handleExperienceInputChange = (id, event) => {
    const { name, value } = event.target;
    setExperienceInputs(experienceInputs.map(input => (input.id === id ? { ...input, [name]: value } : input)));
  };

  const handleCertificatesInputChange = (id, event) => {
    const { name, value } = event.target;
    setCertificatesInputs(certificatesInputs.map(input => (input.id === id ? { ...input, [name]: value } : input)));
  };

  const addInputField = () => {
    setInputs([...inputs, { id: Date.now(), project_name: '', brief_description: '', role_of_employee: '', technologies_used: '', company_image: '' }]);
  };

  const addEductionalInputField = () => {
    setEductionalInputs([...eductionalInputs, { id: Date.now(), institution_names: '', course: '', from_year: '', to_year: '', grading: '', description: '' }]);
  };

  const addExperienceInputField = () => {
    setExperienceInputs([...experienceInputs, { id: Date.now(), company_pic: '', company_name: '', role_of_employee: '', used_technology: '', working_from: '', working_to: '', location: '', responsibilities: '' }]);
  };

  const addCertificatesInputField = () => {
    setCertificatesInputs([...certificatesInputs, { id: Date.now(), certificate_name: '', date_of_certification: '', issuing_organization: '', grade: '', description: '' }]);
  };

  const removeInputField = (id) => {
    setInputs(inputs.filter(input => input.id !== id));
  };

  const removeEductionalInputField = (id) => {
    setEductionalInputs(eductionalInputs.filter(input => input.id !== id));
  };

  const removeExperienceInputField = (id) => {
    setExperienceInputs(experienceInputs.filter(input => input.id !== id));
  };

  const removeCertificatesInputField = (id) => {
    setCertificatesInputs(certificatesInputs.filter(input => input.id !== id));
  };

  const handleChange = (event) => {
    const { name, value } = event.target;

    const keys = name.split('.');
    if (keys.length > 1) {
      setUser(prevUser => ({
        ...prevUser,
        [keys[0]]: {
          ...prevUser[keys[0]],
          [keys[1]]: value
        }
      }));
    } else {
      setUser({ ...user, [name]: value });
    }
  };

  const handleFileChange = (id, event) => {
    const file = event.target.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onloadend = () => {
            setImagePreviews((prev) => ({ ...prev, [id]: reader.result }));
        };
        reader.readAsDataURL(file);
        
        setImageFile((prevFiles) => ({
            ...prevFiles,
            [id]: file
        }));
        
        setUser((prevInputs) => 
          Array.isArray(prevInputs) 
              ? prevInputs.map((input) => 
                  input.id === id ? { ...input, company_logo: file.name } : input
                )
              : prevInputs
      );
    }
  };  

  const handleSubmit = (e) => {
    e.preventDefault();

    const formData = new FormData();
        if (user.name) formData.append('name', user.name);
        if (user.employee?.phone) formData.append('phone', user.employee?.phone);
        if (user.employee?.current_address) formData.append('current_address', user.employee?.current_address);
        if (user.employee?.adhar_card_no) formData.append('adhar_card_no', user.employee?.adhar_card_no);
        if (user.employee?.skills) formData.append('skills', user.employee?.skills);
        if (user.employee?.dates_of_employment) formData.append('dates_of_employment', user.employee?.dates_of_employment);
        if (user.employee?.current_working_skill) formData.append('current_working_skill', user.employee?.current_working_skill);
        if (user.employee?.languages) formData.append('languages', user.employee?.languages);
        if (user.employee?.hobbies) formData.append('hobbies', user.employee?.hobbies);
        if (user.employee?.gender) formData.append('gender', user.employee?.gender);
        if (user.employee?.marital_status) formData.append('marital_status', user.employee?.marital_status);
        if (user.employee?.company_name) formData.append('company_name', user.employee?.company_name);
        if (user.employee?.responsibilities_and_achievements) formData.append('responsibilities_and_achievements', user.employee?.responsibilities_and_achievements);
        if (user.employee?.coursework_or_academic_achievements) formData.append('coursework_or_academic_achievements', user.employee?.coursework_or_academic_achievements);
        if (user.employee?.location) formData.append('location', user.employee?.location);
        if (user.employee?.job_title) formData.append('job_title', user.employee?.job_title);
        if (user.employee?.professional_summary) formData.append('professional_summary', user.employee?.professional_summary);
        if (user.employee?.linkedIn_profile) formData.append('linkedIn_profile', user.employee?.linkedIn_profile);
        if (user.employee && fileImage[user.employee.id]) {
          formData.append('company_logo', fileImage[user.employee.id]);
      }
      
        const project_Data = inputs.map((input) => ({
          project_name: input.project_name,
          brief_description: input.brief_description,
          role_of_employee: input.role_of_employee,
          technologies_used: input.technologies_used
      }));
      
      inputs.forEach((input) => {
          if (fileInputs[input.id]) {
              formData.append('company_image[]', fileInputs[input.id]); 
          }
      });

        const certificate_data = certificatesInputs.map(input => ({
            certificate_name: input.certificate_name,
            date_of_certification: input.date_of_certification,
            issuing_organization: input.issuing_organization,
            grade: input.grade,
            description: input.description,
        }));

        const education_data = eductionalInputs.map(input => ({
            institution_names: input.institution_names,
            course: input.course,
            from_year: input.from_year,
            to_year: input.to_year,
            grading: input.grading,
            description: input.description,
        }));

        const experience_data = experienceInputs.map(input => ({
            company_name: input.company_name,
            role_of_employee: input.role_of_employee,
            used_technology: input.used_technology,
            working_from: input.working_from,
            working_to: input.working_to,
            location: input.location,
            responsibilities: input.responsibilities,
        }));
      
        experienceInputs.forEach((input, index) => {
          if (fileData[input.id]) {
              formData.append(`company_pic[]`, fileData[input.id]);
          }
      });

        for (const key in formData) {
            if (formData.hasOwnProperty(key)) {
                formData.append(key, formData[key]);
            }
        }
  
        formData.append('project_data', JSON.stringify(project_Data));

        formData.append('certificate_data', JSON.stringify(certificate_data));

        formData.append('education_data', JSON.stringify(education_data));

        formData.append('experience_data', JSON.stringify(experience_data));
        
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
                                           <ImageUpload user={user} setUser={setUser} />
                                            <div className="select-job-items2">
                                                <form onSubmit={handleSubmit} enctype="multipart/form-data">
                                                    <div className='row mt-30 '>
                                                       <label className='col-lg-2 d-flex justify-content-end'>Name</label>
                                                       <input className="form-control col-lg-3" type="text" value={user.name} onChange={handleChange} name="name"/>
                                                        <label className='col-lg-2 d-flex justify-content-end'>Email</label>
                                                        <input className="form-control col-lg-3" type="text" value={user.email} onChange={handleChange} name="email"/>
                                                    </div>
                                    
                                                    <div className='row mt-30'>
                                                        <label className='col-lg-2 d-flex justify-content-end' >Mobile Number</label>
                                                        <input className="form-control col-lg-3" type="number"value={user.employee?.phone} onChange={handleChange} name="employee.phone"/>
                                                        <label className='col-lg-2 d-flex justify-content-end'>Current Address</label>
                                                        <input className="form-control col-lg-3" type="text"value={user.employee?.current_address} onChange={handleChange} name="employee.current_address"/>
                                                    </div>
                                        
                                                    <div className='row mt-30'>    
                                                        <label className='col-lg-2 d-flex justify-content-end'>Aadhar Number</label>
                                                        <input className="form-control col-lg-3" type="text"value={user.employee?.adhar_card_no} onChange={handleChange} name="employee.adhar_card_no"/>
                                                        <label className='col-lg-2 d-flex justify-content-end'>Skills</label>
                                                        <input className="form-control col-lg-3" type="text"value={user.employee?.skills} onChange={handleChange} name="employee.skills"/>
                                                    </div>
                                    
                                                    <div className='row mt-30'>
                                                        <label className='col-lg-2 d-flex justify-content-end'>Current working skill</label>
                                                        <input className="form-control col-lg-3" type="text"value={user.employee?.current_working_skill} onChange={handleChange} name="employee.current_working_skill"/> 
                                                        <label className='col-lg-2 d-flex justify-content-end'>Languages</label>
                                                        <input className="form-control col-lg-3" type="text"value={user.employee?.languages} onChange={handleChange} name="employee.languages"/>
                                                    </div>
                                        
                                                    <div className='row mt-30'>
                                                        <label className='d-flex justify-content-end col-lg-2'>Hobbies</label>
                                                        <input className="form-control col-lg-3" type="text"value={user.employee?.hobbies} onChange={handleChange} name="employee.hobbies"/>
                                                        <label className='d-flex justify-content-end col-lg-2'>Gender</label>
                                                        <select className="form-control col-lg-3"  onChange={handleChange} name="employee.gender" value={user.employee?.gender}>
                                                            <option value="">Select Gender</option>
                                                            <option value="Male">Male</option>
                                                            <option value="Female">Female</option>
                                                            <option value="Other">Other</option>
                                                        </select>  
                                                    </div>

                                                    <div className='mt-30 row'>
                                                        <label className='d-flex justify-content-end col-lg-2'>Marital status</label>
                                                        <select className="form-control col-lg-3" type="text" value={user.employee?.marital_status} onChange={handleChange} name="employee.marital_status">
                                                            <option value="">Select Marital Status</option>
                                                            <option value="1">Married</option>
                                                            <option value="0">UnMarried</option>
                                                        </select>
                                                        <label className='d-flex justify-content-end col-lg-2'>Company Name</label>
                                                        <input className="form-control col-lg-3" type="text" value={user.employee?.company_name} onChange={handleChange} name="employee.company_name"/>
                                                    </div>
                                    
                                                    <div className='mt-30 row'>
                                                        <label className='d-flex justify-content-end col-lg-2'>Responsibilities and Achievements</label>
                                                        <input className="form-control col-lg-3" type="text" value={user.employee?.responsibilities_and_achievements} onChange={handleChange} name="employee.responsibilities_and_achievements"/>
                                                        <label className='d-flex justify-content-end col-lg-2'>Dates of Employment</label>
                                                        <input className="form-control col-lg-3" type="date"value={user.employee?.dates_of_employment} onChange={handleChange} name="employee.dates_of_employment"/>
                                                    </div > 
                                    
                                                    <div className='row mt-30'>
                                                        <label className='d-flex justify-content-end col-lg-2'>Location</label>
                                                        <input className="form-control col-lg-3" type="text"value={user.employee?.location} onChange={handleChange} name="employee.location"/> 
                                                        <label className='d-flex justify-content-end col-lg-2'>Job Title</label>
                                                        <input className="form-control col-lg-3" type="text"value={user.employee?.job_title} onChange={handleChange} name="employee.job_title"/>
                                                    </div>
                                        
                                                    <div className='row mt-30 '>
                                                        <label className='d-flex justify-content-end col-lg-2'>Professional Summary</label>
                                                        <input className="form-control col-lg-3" type="text"value={user.employee?.professional_summary} onChange={handleChange} name="employee.professional_summary"/> 
                                                        <label className='d-flex justify-content-end col-lg-2'>LinkedIn Profile</label>
                                                        <input className="form-control col-lg-3" type="text"value={user.employee?.linkedIn_profile} onChange={handleChange} name="employee.linkedIn_profile"/>  
                                                    </div>

                                                    <div className='row mt-30'>
                                                        <label className='d-flex justify-content-end col-lg-2'>Company Image</label>

                                                        <input
                                                            className="form-control col-lg-3"
                                                            type="file"
                                                            accept="image/*"
                                                            onChange={(event) => handleFileChange("company_logo", event)} 
                                                        />

                                                        {imagePreviews["company_logo"] ? (
                                                            <img
                                                                src={imagePreviews["company_logo"]} 
                                                                alt="Preview"
                                                                className="edit-image" 
                                                            />
                                                        ) : (
                                                            <img
                                                                src={`${baseURL}/uploads/${user.employee?.company_logo}`} 
                                                                alt=""
                                                                className="edit-image" 
                                                            />
                                                        )}
                                                    </div>


                                        
                                                    <DynamicForm
                                                        fileInputs={fileInputs}
                                                        setFileInputs={setFileInputs}
                                                        setInputs={setInputs}
                                                        inputs={inputs}
                                                        handleInputChange={handleInputChange}
                                                        addInputField={addInputField}
                                                        removeInputField={removeInputField}
                                                        handleSubmit={handleSubmit}
                                                    />

                                                    <EducationForm
                                                        inputs={eductionalInputs} 
                                                        handleInputChange={handleEductionalInputChange} 
                                                        addInputField={addEductionalInputField}
                                                        removeInputField={removeEductionalInputField}
                                                    />

                                                    <ExperienceForm
                                                        fileInputs={fileData}
                                                        setFileInputs={setFileData}
                                                        inputs={experienceInputs} 
                                                        setInputs={setExperienceInputs}
                                                        handleInputChange={handleExperienceInputChange} 
                                                        addInputField={addExperienceInputField}
                                                        removeInputField={removeExperienceInputField}
                                                    />

                                                    <CertificatesFile
                                                        inputs={certificatesInputs}
                                                        handleInputChange={handleCertificatesInputChange}
                                                        addInputField={addCertificatesInputField}
                                                        removeInputField={removeCertificatesInputField}
                                                    />

                                                    <div className="row">
                                                        <div className='col-lg-5'></div>
                                                        <div className='col-lg-2'>
                                                            <button type='submit' class="genric-btn success-border radius mt-30">Save</button>
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