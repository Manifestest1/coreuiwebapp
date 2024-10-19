import { useNavigate } from 'react-router-dom';
import React, { useState, useRef, useEffect } from 'react';
import { updateUserProfile } from '../../../../apiService';

const EmployeeProfile = ({ user, setUser }) => {
    const [imageFile, setImageFile] = useState(null); 
    const [imagePreview, setImagePreview] = useState(null);
    const [projectData, setProjectData] = useState([]);
    const [certificateData, setCertificateData] = useState([]);
    const [educationData, setEducationData] = useState([]);
    const [experienceData, setExperienceData] = useState([]);
    const imageInputRef = useRef(null);
    const navigate = useNavigate();
    const baseURL = process.env.REACT_APP_API_URL; 
    
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
            formData.append('profile_image', file); 

            const response = await updateUserProfile(formData); 
            setUser(response.data); 
            console.log(response.data,"responses")
            setProjectData(response.data.projects); 
            setCertificateData(response.data.certificates);
            setEducationData(response.data.education);
            setExperienceData(response.data.experience);
            console.warn('Image updated successfully', response.data);
        } catch (error) {
            console.error('Error updating image', error);
        }
    };
    
    useEffect(() => {
        updateUserImage();  
    }, []);

    const downloadPDF = (userId) => {
        console.log(userId, "Get Userid");
        fetch(`http://localhost:8000/api/auth/employee-download-pdf/${userId}`)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.blob();
            })
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
                            <div class="single-slider section-overly slider-height2 d-flex align-items-center single-slider-contact" >
                                <div class="container">
                                    <div class="row">
                                        <div class="col-xl-12">
                                            <div class="hero-cap text-center">
                                                <h4>My Profile</h4>
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
                                        <div class=" mb-50">
                                            <div class="single-listing">
                                                <div class="select-job-items2">
                                                    <div className='row '>
                                                        <div className='col-lg-2'>
                                                            <input id="image-input" type="file" accept="image/*" onChange={handleImageChange}  ref={imageInputRef} name="profile_image" />
                                                            {/* Image preview */}
                                                            {imagePreview ? (
                                                                <img id='img-Preview' src={imagePreview} alt="Preview" className="profile-image"/>
                                                            ) : (
                                                                user.profile_image ? (
                                                                    <img id='img-baseurl' src={`${baseURL}/uploads/${user.profile_image}`}  alt="Profile" className="profile-image" />
                                                                ) : (
                                                                    <img id='img-url' src="/download.png"  alt="Default Profile" className="profile-image" />
                                                                )
                                                            )}
                                                            {/* Button to replace input field */}
                                                            <button className='image-update' onClick={handleImageUpdate}><i className="fas fa-camera"></i></button>
                                                        </div>
                                                        <div className='col-lg-6'>
                                                            <h4>
                                                                <div>{user.name}</div>
                                                            </h4>
                                                            <div>
                                                                <span >{user.employee?.linkedIn_profile}</span><br /> 
                                                                <span >Email:   {user.email}</span><br/>
                                                                <span >Contact:   {user.employee?.phone}</span><br />
                                                                <span >Address:   {user.employee?.current_address}</span>
                                                            </div>
                                                        </div>
                                                        <div className='col-lg-2 mt-30'>
                                                            <button onClick={() => downloadPDF(user.id)} class="genric-btn success-border radius">Download PDF</button>
                                                        </div>
                                                        <div className='col-lg-2 mt-30'>
                                                           <button id='edit-employee-button' onClick={handleEditProfileClick} class="genric-btn success-border radius">Edit Profile</button>
                                                        </div>
                                                    </div>
                                                    <div className='row background-change mt-30'>
                                                        <div className='col-lg-12 mt-30'>
                                                            <h4 >About:</h4>
                                                            <div className='margin mt-30'>{user.employee?.professional_summary}</div> 
                                                        </div> 
                                                    </div>
                                                    <div className='row background-change'>
                                                        <div className='col-lg-12 mt-30'>
                                                            <h4>Educational Qualification</h4>
                                                            {educationData.length > 0 ? (
                                                                 educationData.map((education, index) => (
                                                                    <div className="custom-flex">
                                                                    <span className="custom-bullet">•</span>
                                                                    <div className='margin mt-30'>
                                                                        <h5>{education.institution_names}</h5>
                                                                        <span>{education.course}</span><br/>
                                                                        <span>{education.from_year}</span><br/>
                                                                        <span>{education.to_year}</span><br/>
                                                                        <span>{education.grading}</span><br/>
                                                                        <span>{education.description}</span><br/> 
                                                                    </div>
                                                                </div>  
                                                                ))
                                                            ) : (
                                                                <p></p>
                                                            )}
                                                        </div> 
                                                    </div>
                                                    <div className='row background-change'>
                                                        <div className='col-lg-12 mt-30'>
                                                            <h4 >Skills</h4> 
                                                            {user.employee?.skills ? (
                                                                <ul className="skills-list margin ">
                                                                    {user.employee.skills.split(',').map((skill, index) => (
                                                                        <li key={index} className="skill-item">
                                                                        <span className="custom-bullet">•</span> 
                                                                        <span>{skill.trim()}</span>
                                                                      </li> // Adding dot before each skill
                                                                    ))}
                                                                </ul>
                                                            ) : (
                                                                <span>No skills available</span>
                                                            )}
                                                        </div> 
                                                    </div>
                                                    <div className='row background-change'>
                                                        <div className='col-lg-12 mt-30'>
                                                            <h4>Current Working Status</h4> 
                                                        </div>
                                                        <div className='row margin mt-30'>
                                                        {user.employee?.company_logo ? (
                                                            <img src={`${baseURL}/uploads/${user.employee?.company_logo}`}  alt="Profile" className="custom-size" />
                                                            ) : (
                                                                <img src="/download.png" alt="Default Profile" className="custom-size" />
                                                            )}
                                                            <div>
                                                                <h5 >{user.employee?.company_name}</h5>
                                                                <h6 >{user.employee?.job_title}</h6>
                                                                <span >{user.employee?.technologies_used}</span><br/>
                                                                <span >{user.employee?.working_from}</span><br/>
                                                                <span >{user.employee?.location}</span><br/>
                                                                <span > {user.employee?.responsibilities_and_achievements}</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div className='row background-change'>
                                                        <div className='col-lg-12 mt-30'>
                                                            <h4>Experience</h4>
                                                        </div> 
                                                        {experienceData.length > 0 ? (
                                                        experienceData.map((experience, index) => (
                                                            <div className='row  col-lg-12 margin mt-30' key={index}>
                                                               { experience.company_image ? (
                                                                    <img src={`${baseURL}/uploads/${experience.company_image}`} alt="Profile" className="custom-size" />
                                                                ) : (
                                                                    <img src="/download.png" alt="Default Profile" className="custom-size" />
                                                                )} 
                                                                    <div>
                                                                        <h5>{experience.company_name}</h5>
                                                                        <h6>{experience.role_of_employee}</h6>
                                                                        <span >{experience.used_technology}</span><br />
                                                                        <span >{experience.working_to} - </span>
                                                                        <span >{experience.working_from}</span><br />
                                                                        <span >{experience.location}</span><br />
                                                                        <span > {experience.responsibilities}</span>
                                                                    </div>
                                                            </div>
                                                            
                                                        ))
                                                        ) : (
                                                            <p></p>
                                                        )}
                                                    </div>
                                                    <div className='row background-change'>
                                                        <div className='col-lg-12 mt-30'>
                                                            <h4 >Projects</h4>  
                                                        </div>
                                                    {projectData.length > 0 ? (
                                                        projectData.map((project, index) => (
                                                            <div className='row  col-lg-12 margin mt-30' key={index}>
                                                                    { project.company_image ? (
                                                                        <img src={`${baseURL}/uploads/${project.company_image}`} alt="Profile" className="custom-size" />
                                                                    ) : (
                                                                        <img src="/download.png" alt="Default Profile" className="custom-size" />
                                                                    )} 
                                                                    <div>
                                                                        <h5>{project.project_name}</h5>
                                                                        <h6>{project.role_of_employee}</h6>
                                                                        <span>{project.technologies_used}</span><br />
                                                                        <span>{project.brief_description}</span><br />
                                                                    </div>
                                                            </div>
                                                        ))
                                                    ) : (
                                                        <p></p>
                                                    )}
                                                </div>
                                                <div className='row background-change'>
                                                    <div className='col-lg-12 mt-30'>
                                                        <h4>Certification</h4> 
                                                    </div>
                                                    {certificateData.length > 0 ? (
                                                        certificateData.map((certificate, index) => (
                                                            <div className='row  col-lg-12 margin' key={index}>
                                                                    <div className='mt-30'>
                                                                        <h5>{certificate.certificate_name}</h5>
                                                                        <span>{certificate.issuing_organization}</span><br/>
                                                                        <span>{certificate.date_of_certification}</span><br/>
                                                                        <span>{certificate.grade}</span><br/>
                                                                        <span>{certificate.description}</span><br/>
                                                                    </div>
                                                            </div>
                                                        ))
                                                    ) : (
                                                        <p></p>
                                                    )}
                                                </div>
                                                    <div className='row background-change'>
                                                        <div className='col-lg-12 mt-30'>
                                                            <h4>Achievements</h4>
                                                            <div className=' margin mt-30'>{user.employee?.coursework_or_academic_achievements}</div>
                                                        </div> 
                                                    </div>
                                                    <div className='row background-change'>
                                                        <div className='col-lg-12 mt-30'>
                                                            <h4>General</h4>
                                                            </div>
                                                            <div className=' margin mt-30'> 
                                                            <span >Gender:   {user.employee?.gender}</span><br/>
                                                            <span >Marriage Status:   {user.employee?.marital_status === 1 ? 'Married' : 'Unmarried'}</span><br/>
                                                            <span >Aadhar Number:   {user.employee?.adhar_card_no}</span> <br/>
                                                            <span >Languages:   {user.employee?.languages}</span><br/>
                                                            <span >Hobbies:   {user.employee?.hobbies}</span><br/>
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