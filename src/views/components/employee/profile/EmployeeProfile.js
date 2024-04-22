import { BrowserRouter as Router, Switch, Route, Link, NavLink, useNavigate } from 'react-router-dom';
import React, { useEffect, useState, useRef } from 'react';
import { updateUserProfile } from '../../../../apiService';
import html2canvas from 'html2canvas';
import jsPDF from 'jspdf';

const EmployeeProfile = ({ user, setUser }) => {
    const [imageFile, setImageFile] = useState(null);
    const [imagePreview, setImagePreview] = useState(null);

    // Function to handle image update
    const handleImageUpdate = () => {
        // Trigger file selection dialog
        document.getElementById('imageInput').click();
    };

    // Function to handle image selection
    const handleImageChange = (e) => {
        const file = e.target.files[0];
        if (file) {
            setImageFile(file);
            const reader = new FileReader();
            reader.onloadend = () => {
                setImagePreview(reader.result);
            };
            reader.readAsDataURL(file);

            // Update the image in the API
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

    const pdfRef = useRef();

    const downloadPDF = () => {
        if (pdfRef.current) {
            const divElement = pdfRef.current;
            divElement.style.fontSize = '25px'; // Adjust font size as needed

            html2canvas(divElement).then((canvas) => {
                const imgData = canvas.toDataURL('image/png');
                const pdf = new jsPDF('p', 'mm', 'a4');
                pdf.addImage(imgData, 'PNG', 15, 15, 150, 150); // A4 size: 210 x 297 mm
                pdf.save('employer_profile.pdf');
            });
        }
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
           {/* <div class="small-section-tittle2"> 
                 <h4>Profile</h4>
           </div> */}
            {/* <!-- Select job items start --> */}
            <div class="select-job-items2">

            <div className='row'>
                <div className='col-lg-7'></div>
                <div className='col-lg-2'>
                   <button onClick={downloadPDF} className='btn'>Download PDF</button>
                </div>
                <div className='col-lg-2'>
                   <NavLink style={{marginLeft: '10px'}} to="/employee-edit-profile" className="btn head-btn2">Edit Profile</NavLink>
                </div>
            </div>
           
            <div className='row' ref={pdfRef}>
               
                <div className='col-lg-12' style={{textAlign:'center',display:'block'}}>
                   
                    <input id="imageInput" type="file" accept="image/*" onChange={handleImageChange} style={{ display: 'none' }} name="imageurl" />
                    {/* Image preview */}
                    {imagePreview ? (
                    <img style={{ height: '145px', width: '150px', borderRadius: '50%' }} src={imagePreview} alt="Preview"/>
                    ) : (
                    <img style={{ height: '145px', width: '150px', borderRadius: '50%' }} src={user?.imageurl || 'default-profile-image-url'} alt="User Profile Image" size="md"/>
                    )}
                    {/* Button to replace input field */}
                    <button style={{cursor:'pointer',background: '#fb246a',borderRadius: '20%',border: 'none',position: 'absolute',bottom: '3px',left: '48%',width:'56px'}} onClick={handleImageUpdate}><i class="fas fa-camera"></i></button>
                </div>
               
                
                <div className='col-lg-3 label-customcss'>
                    <label className='mt-30'>Name</label>
                </div>
                <div className='col-lg-3'>
                   <label className='mt-30'>{user.name}</label>
                </div>

                <div className='col-lg-3 label-customcss'>
                    <label className='mt-30'>Email</label>
                </div>
                <div className='col-lg-3'>
                    <label className='mt-30'>{user.email}</label>
                </div>

                <div className='col-lg-3 label-customcss'>
                    <label className='mt-30'>Mobile Number</label>
                </div>
                <div className='col-lg-3'>
                    <label className='mt-30'>{user.employee?.phone}</label> 
                </div>

                <div className='col-lg-3 label-customcss'>
                    <label className='mt-30'>Current Address</label>
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
                <div className='col-lg-3 '>
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
                    <label className='mt-30'>{user.employee?.current_working_skill}</label> 
                </div>

                <div className='col-lg-3 label-customcss'>
                    <label className='mt-30'>Languages</label>
                </div>
                <div className='col-lg-3'>
                    <label className='mt-30'>{user.employee?.languages}</label> 
                </div>

                <div className='col-lg-3 label-customcss'>
                    <label className='mt-30'>Hobbies</label>
                </div>
                <div className='col-lg-3'>
                    <label className='mt-30'>{user.employee?.hobbies}</label> 
                </div>

                <div className='col-lg-3 label-customcss'>
                    <label className='mt-30'>Country</label>
                </div>
                <div className='col-lg-3'>
                    <label className='mt-30'>{user.employee?.country}</label> 
                </div>

                <div className='col-lg-3 label-customcss'>
                    <label className='mt-30'>State</label>
                </div>
                <div className='col-lg-3'>
                    <label className='mt-30'>{user.employee?.state}</label> 
                </div>

                <div className='col-lg-3 label-customcss'>
                    <label className='mt-30'>City</label>
                </div>
                <div className='col-lg-3'>
                    <label className='mt-30'>{user.employee?.city}</label>   
                </div>

                <div className='col-lg-3 label-customcss'>
                    <label className='mt-30'>Pincode</label>
                </div>
                <div className='col-lg-3'>
                    <label className='mt-30'>{user.employee?.pincode}</label>  
                </div>

                <div className='col-lg-3 label-customcss'>
                    <label className='mt-30'>Gender</label>
                </div>
                <div className='col-lg-3'>
                    <label className='mt-30'>{user.employee?.gender}</label>  
                </div>



            </div>
            {/* <input className="form-control mt-30" type="file" onChange={handleChange} name="imageurl" /> */}
            
                {/* <select className="form-control mt-30" name="select">
                    <option value="">All Category</option>
                    <option value="1">Employee</option>
                    <option value="2">Employer</option>
                </select> */}
               
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
        ) : (
            <p></p> 
        )}
        </>
    )
}
export default EmployeeProfile