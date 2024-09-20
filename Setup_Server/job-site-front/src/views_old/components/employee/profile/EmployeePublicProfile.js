import React, { useEffect, useState, useRef } from 'react';
import { useParams } from 'react-router-dom';
import { getPublicEmployeeProfile } from '../../../../apiService';
import html2canvas from 'html2canvas';
import jsPDF from 'jspdf';

const EmployeePublicProfile = () => {
    const { userId } = useParams();
    const [user, setUser] = useState({});

    const downloadPDF = (userId) => {
            console.log(userId,"Get Userid");
            fetch('https://staging.fyies.com/jobsite/backend/api/auth/employee-download-pdf/${userId}')
           .then(response => response.blob())
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

    useEffect(() => {
        getPublicEmployeeProfile(userId)
            .then((response) => {
                setUser(response.data);
            })
            .catch((error) => {
                console.error(error);
            });
    }, [userId]);

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
                                <div class="col-lg-12 col-md-12">
                                    <div class="job-category-listing mb-50">
                                        <div class="single-listing">
                                            <div class="select-job-items2">
                                                <div className='row'>
                                                    <div className='col-lg-7' id='employee-public-3'>
                                                        {user.imagebaseurl? <img id='employee-public-1' src={user.imagebaseurl + user?.imageurl} alt="User Profile Image" size="md" /> :<img id='stile' src={user?.imageurl} alt="User Profile Image" size="md" />}
                                                    </div>
                                                    <div className='col-lg-5' id='employee-public-2'>
                                                       <button onClick={() => downloadPDF(user.id)} class="genric-btn success-border radius">Download PDF</button>
                                                    </div>
                                                </div>
                                                <div className='row'>
                                                    <div className='col-lg-3'>
                                                        <label className='mt-30 label-customcss'>Name</label>
                                                    </div>
                                                    <div className='col-lg-3'>
                                                       <div className='mt-30'>{user.name}</div>
                                                    </div>
                                                    <div className='col-lg-3'>
                                                        <label className='mt-30 label-customcss'>Email</label>
                                                    </div>
                                                    <div className='col-lg-3'>
                                                        <div className='mt-30'>{user.email}</div>
                                                    </div>
                                                    <div className='col-lg-3'>
                                                        <label className='mt-30 label-customcss'>Mobile Number</label>
                                                    </div>
                                                    <div className='col-lg-3'>
                                                        <div className='mt-30'>{user.employee?.phone}</div> 
                                                    </div>
                                                    <div className='col-lg-3'>
                                                        <label className='mt-30 label-customcss'>Current Address</label>
                                                    </div>
                                                    <div className='col-lg-3'>
                                                        <div className='mt-30'>{user.employee?.current_address}</div> 
                                                    </div>
                                                    <div className='col-lg-3 label-customcss'>
                                                        <label className='mt-30'>Permanent Address</label>
                                                    </div>
                                                    <div className='col-lg-3'>
                                                        <div className='mt-30'>{user.employee?.permanent_address}</div>   
                                                    </div>
                                                    <div className='col-lg-3 label-customcss'>
                                                        <label className='mt-30'>Aadhar Number</label>
                                                    </div>
                                                    <div className='col-lg-3'>
                                                        <div className='mt-30'>{user.employee?.adhar_card_no}</div>  
                                                    </div>
                                                    <div className='col-lg-3 label-customcss'>
                                                        <label className='mt-30'>Qualification</label>
                                                    </div>
                                                    <div className='col-lg-3'>
                                                        <div className='mt-30'>{user.employee?.qualification}</div>  
                                                    </div>
                                                    <div className='col-lg-3 label-customcss'>
                                                        <label className='mt-30'>Certifications</label>
                                                    </div>
                                                    <div className='col-lg-3'>
                                                        <div className='mt-30'>{user.employee?.certifications}</div> 
                                                    </div>
                                                    <div className='col-lg-3 label-customcss'>
                                                        <label className='mt-30'>Skills</label>
                                                    </div>
                                                    <div className='col-lg-3'>
                                                        <div className='mt-30'>{user.employee?.skills}</div> 
                                                    </div>
                                                    <div className='col-lg-3 label-customcss'>
                                                        <label className='mt-30'>Working From</label>
                                                    </div>
                                                    <div className='col-lg-3'>
                                                        <div className='mt-30'>{user.employee?.working_from}</div>  
                                                    </div>
                                                    <div className='col-lg-3 label-customcss'>
                                                        <label className='mt-30'>Work Experience</label>
                                                    </div>
                                                    <div className='col-lg-3'>
                                                        <div className='mt-30'>{user.employee?.work_experience}</div> 
                                                    </div>
                                                    <div className='col-lg-3 label-customcss'>
                                                        <label className='mt-30'>Current working skill</label>
                                                    </div>
                                                    <div className='col-lg-3'>
                                                        <div className='mt-30'>{user.employee?.current_working_skill}</div> 
                                                    </div>
                                                    <div className='col-lg-3'>
                                                        <label className='mt-30 label-customcss'>Languages</label>
                                                    </div>
                                                    <div className='col-lg-3'>
                                                        <div className='mt-30'>{user.employee?.languages}</div> 
                                                    </div>
                                                    <div className='col-lg-3'>
                                                        <label className='mt-30 label-customcss'>Hobbies</label>
                                                    </div>
                                                    <div className='col-lg-3'>
                                                        <div className='mt-30'>{user.employee?.hobbies}</div> 
                                                    </div>
                                                    <div className='col-lg-3'>
                                                        <label className='mt-30 label-customcss'>Country</label>
                                                    </div>
                                                    <div className='col-lg-3'>
                                                        <div className='mt-30'>{user.employee?.country}</div> 
                                                    </div>
                                                    <div className='col-lg-3'>
                                                        <label className='mt-30 label-customcss'>State</label>
                                                    </div>
                                                    <div className='col-lg-3'>
                                                        <div className='mt-30'>{user.employee?.state}</div> 
                                                    </div>                                                
                                                    <div className='col-lg-3'>
                                                        <label className='mt-30 label-customcss'>City</label>
                                                    </div>
                                                    <div className='col-lg-3'>
                                                        <div className='mt-30'>{user.employee?.city}</div>   
                                                    </div>                                                
                                                    <div className='col-lg-3'>
                                                        <label className='mt-30 label-customcss'>Pincode</label>
                                                    </div>
                                                    <div className='col-lg-3'>
                                                        <div className='mt-30'>{user.employee?.pincode}</div>  
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
export default EmployeePublicProfile