import { useNavigate } from 'react-router-dom';
import React, { useState, useRef, useEffect } from 'react';
import { updateUserProfile } from '../../../../apiService';

const EmployeeProfile = ({ user, setUser }) => {
    const [imageFile, setImageFile] = useState(null); 
    const [imagePreview, setImagePreview] = useState(null);
    const [projectData, setProjectData] = useState([]);
    const [certificateData, setCertificateData] = useState([]);
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
            setProjectData(response.data.projects);
            console.warn('Image updated successfully', response.data);
        } catch (error) {
            console.error('Error updating image', error);
        }
    };

    const fetchCertificateData = async () => {
        try {
            const response = await updateUserProfile(user.id); 
            setCertificateData(response.data.certificates);
            console.log('Project data fetched successfully', response.data.certificates);
        } catch (error) {
            console.error('Error fetching project data', error);
        }
    };
    
    useEffect(() => {
        if (user) {
            fetchCertificateData(); 
            fetchProjectData();
        }
    }, [user]);

    const fetchProjectData = async () => {
        try {
            const response = await updateUserProfile(user.id); 
            setProjectData(response.data.projects);
            console.log('Project data fetched successfully', response.data.projects);
        } catch (error) {
            console.error('Error fetching project data', error);
        }
    };

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
                                                        <div className='col-lg-6 '>
                                                            <label className='mt-30'>
                                                                <span className='profilecolor'>Name:   </span> 
                                                                <span >{user.name}</span>
                                                            </label>
                                                        </div>
                                                        <div className='col-lg-6 '>
                                                            <label className='mt-30'>
                                                                <span className='profilecolor'>Email:   </span>  
                                                                <span >{user.email}</span>
                                                            </label> 
                                                        </div>
                                                        <div className='col-lg-6 '>
                                                            <label className='mt-30'>
                                                                <span className='profilecolor'>Mobile Number:   </span>  
                                                                <span >{user.employee?.phone}</span>
                                                            </label>
                                                        </div>
                                                        <div className='col-lg-6 '>
                                                            <label className='mt-30'>
                                                                <span className='profilecolor'>Current Address:   </span>  
                                                                <span >{user.employee?.current_address}</span>
                                                            </label>
                                                        </div>
                                                        <div className='col-lg-6 '>
                                                            <label className='mt-30'>
                                                                <span className='profilecolor'>Permanent Address:   </span>  
                                                                <span >{user.employee?.permanent_address}</span>
                                                            </label>
                                                        </div>
                                                        <div className='col-lg-6 '>
                                                            <label className='mt-30'>
                                                                <span className='profilecolor'>Aadhar Number:   </span>  
                                                                <span >{user.employee?.adhar_card_no}</span>
                                                            </label>
                                                        </div> 
                                                        <div className='col-lg-6 '>
                                                            <label className='mt-30'>
                                                                <span className='profilecolor'>Qualification:   </span>  
                                                                <span >{user.employee?.qualification}</span>
                                                            </label>
                                                        </div>
                                                        <div className='col-lg-6 '>
                                                            <label className='mt-30'>
                                                                <span className='profilecolor'>Certifications: </span> 
                                                                <span >{user.employee?.certifications}</span>
                                                            </label>
                                                        </div>
                                                        <div className='col-lg-6 '>
                                                            <label className='mt-30'>
                                                                <span className='profilecolor'>Skills:   </span>   
                                                                <span >{user.employee?.skills}</span>
                                                            </label>
                                                        </div>
                                                        <div className='col-lg-6 '>
                                                            <label className='mt-30'>
                                                                <span className='profilecolor'>Working From:   </span>  
                                                                <span >{user.employee?.working_from}</span>
                                                            </label>
                                                        </div>
                                                        <div className='col-lg-6 '>
                                                            <label className='mt-30'>
                                                                <span className='profilecolor'>
                                                                Work Experience:   </span> 
                                                                <span >{user.employee?.work_experience}</span>
                                                            </label>
                                                        </div>
                                                        <div className='col-lg-6 '>
                                                            <label className='mt-30'>
                                                                <span className='profilecolor'>Current working skill:   </span>  
                                                                <span >{user.employee?.current_working_skill}</span>
                                                            </label>
                                                        </div>
                                                        <div className='col-lg-6 '>
                                                            <label className='mt-30'>
                                                                <span className='profilecolor'>Languages:   </span>  
                                                                <span >{user.employee?.languages}</span>
                                                            </label>
                                                        </div>
                                                        <div className='col-lg-6 '>
                                                            <label className='mt-30'>
                                                                <span className='profilecolor'>Hobbies:   </span>  
                                                                <span >{user.employee?.hobbies}</span>
                                                        </label>
                                                        </div>
                                                        <div className='col-lg-6 '>
                                                            <label className='mt-30'>
                                                                <span className='profilecolor'>Country:   </span>  
                                                                <span >{user.employee?.country}</span>
                                                            </label>
                                                        </div>
                                                        <div className='col-lg-6 '>
                                                            <label className='mt-30'>
                                                                <span className='profilecolor'>State:   </span>  
                                                                <span >{user.employee?.state}</span>
                                                            </label>
                                                        </div>
                                                        <div className='col-lg-6 '>
                                                            <label className='mt-30'>
                                                                <span className='profilecolor'>City:   </span>  
                                                                <span >{user.employee?.city}</span>
                                                            </label>
                                                        </div>
                                                        <div className='col-lg-6 '>
                                                            <label className='mt-30'>
                                                                <span className='profilecolor'>Pincode:   </span>  
                                                                <span >{user.employee?.pincode}</span>
                                                            </label>
                                                        </div>
                                                        <div className='col-lg-6 '>
                                                            <label className='mt-30'>
                                                                <span className='profilecolor'>Marriage Status:   </span>
                                                                <span >{user.employee?.marriage_status}</span>
                                                            </label>
                                                        </div>
                                                        <div className='col-lg-6 '>
                                                            <label className='mt-30'>
                                                                <span className='profilecolor'>Gender:   </span>
                                                                <span >{user.employee?.gender}</span>
                                                            </label>
                                                        </div>
                                                        <div className='col-lg-6 '>
                                                            <label className='mt-30'><span className='profilecolor'>company Name:   </span>  
                                                            <span >{user.employee?.company_name}</span>
                                                        </label>
                                                        </div>
                                                        <div className='col-lg-6 '>
                                                            <label className='mt-30'>
                                                                <span className='profilecolor'>Responsibilities and Achievements:   </span>
                                                                <span >{user.employee?.responsibilities_and_achievements}</span>
                                                            </label>
                                                        </div>
                                                        <div className='col-lg-6 '>
                                                            <label className='mt-30'>
                                                                <span className='profilecolor'>Degree:   </span>  
                                                                <span >{user.employee?.Degree}</span>
                                                            </label>
                                                        </div>
                                                        <div className='col-lg-6 '>
                                                            <label className='mt-30'>
                                                                <span className='profilecolor'>
                                                                    University or College Name:   </span>  
                                                                <span >{user.employee?.university_or_collegeName}</span>
                                                            </label>
                                                        </div>
                                                        <div className='col-lg-6 '>
                                                            <label className='mt-30'>
                                                                <span className='profilecolor'>Graduation Date:   </span> 
                                                                <span >{user.employee?.graduation_date}</span>
                                                            </label>
                                                        </div>
                                                        <div className='col-lg-6 '>
                                                            <label className='mt-30'>
                                                            <span className='profilecolor'>Course Work or Academic Achievements:   </span>  
                                                                <span >{user.employee?.coursework_or_academic_achievements}</span>
                                                            </label>
                                                        </div>
                                                        <div className='col-lg-6 '>
                                                            <label className='mt-30'>
                                                                <span className='profilecolor'>Dates of Employment: </span> 
                                                                <span >{user.employee?.dates_of_employment}</span>
                                                            </label>
                                                        </div>
                                                        <div className='col-lg-6 '>
                                                            <label className='mt-30'>
                                                                <span className='profilecolor'>Location:   </span>  
                                                                <span >{user.employee?.location}</span>
                                                            </label>
                                                        </div>
                                                        <div className='col-lg-6 '>
                                                            <label className='mt-30'>
                                                                <span className='profilecolor' >Job Title:   </span>  
                                                                <span >{user.employee?.job_title}</span>
                                                            </label>
                                                        </div>
                                                        <div className='col-lg-6 '>
                                                            <label className='mt-30'>
                                                                <span className='profilecolor' >Professional Summary:   </span>  
                                                                <span >{user.employee?.professional_summary}</span>
                                                            </label>
                                                        </div>
                                                        <div className='col-lg-6 '>
                                                            <label className='mt-30'>
                                                                <span className='profilecolor' >LinkedIn Profile:   </span>  
                                                                <span >{user.employee?.linkedIn_profile}</span>
                                                            </label>
                                                        </div>
                                                        <div className='col-lg-6 '>
                                                            <label className='mt-30'>
                                                                <span className='profilecolor' >Proficiency Level of Language:   </span> 
                                                                <span >{user.employee?.proficiency_level_of_language}</span>
                                                            </label>
                                                        </div>
                                                        <div className='col-lg-6 '>
                                                            <label className='mt-30'>
                                                                <span className='profilecolor' >References:   </span>  
                                                                <span >{user.employee?.References}</span>
                                                            </label>
                                                        </div>
                                                        <div className='row project'>
                                                        <div className='col-lg-12 '>
                                                            <label className='mt-30 '>Project Details</label>
                                                        </div>
                                                    </div>
                                                    
                                                    {projectData.length > 0 ? (
                                                        <div className='col-lg-12'>
                                                            {projectData.map((project, index) => (
                                                                <div key={index} className='row'>
                                                                    <div className='col-lg-6'>
                                                                        <label className='mt-30'>
                                                                            <span className='profilecolor' >Project Title: </span>  
                                                                            <span >{project.project_name}</span>
                                                                        </label>
                                                                    </div>
                                                                    <div className='col-lg-6'>
                                                                        <label className='mt-30'>
                                                                            <span className='profilecolor' >Brief Description:   </span>  
                                                                            <span >{project.brief_description}</span>
                                                                        </label>
                                                                    </div>
                                                                    <div className='col-lg-6'>
                                                                        <label className='mt-30 profilecolor'>
                                                                           <span className='profilecolor' >Role and Contributions:   </span>  
                                                                            <span >{project.role_and_contributions}</span>
                                                                            </label>
                                                                    </div>
                                                                    <div className='col-lg-6'>
                                                                        <label className='mt-30'>
                                                                        <span className='profilecolor' >Technologies Used:   </span> 
                                                                            <span >{project.Technologies_used}</span>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                            ))}
                                                        </div>
                                                    ) : (
                                                        <p>No projects available.</p>
                                                    )}
                                                    <div className='row project'>
                                                        <div className='col-lg-12 '>
                                                            <label className='mt-30 '>Certificate Details</label>
                                                        </div>
                                                    </div>
                                                    
                                                    {certificateData.length > 0 ? (
                                                        <div className='col-lg-12'>
                                                            {certificateData.map((certificate, index) => (
                                                            <div key={index} className='row'>
                                                                <div className='col-lg-6 '>
                                                                    <label className='mt-30'>
                                                                        <span className='profilecolor' >Certificate Name:   </span> 
                                                                        <span >{certificate.certificate_name}</span>
                                                                    </label>
                                                                </div>
                                                                <div className='col-lg-6 '>
                                                                    <label className='mt-30'>
                                                                        <span className='profilecolor' >Issuing Organization:   </span>  
                                                                        <span >{certificate.issuing_organization}</span>
                                                                    </label>
                                                                </div>
                                                                <div className='col-lg-6 '>
                                                                    <label className='mt-30 '>
                                                                            <span className='profilecolor'>Date Of Certification:   </span>  
                                                                            <span >{certificate.date_of_certification}</span>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            ))}
                                                        </div>
                                                    ) : (
                                                        <p>No certificates available.</p>
                                                    )}
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