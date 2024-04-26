import React, { useEffect, useState, useRef } from 'react';
import { useParams } from 'react-router-dom';
import { getPublicEmployeeProfile } from '../../../../apiService';
import html2canvas from 'html2canvas';
import jsPDF from 'jspdf';

const EmployeePublicProfile = () => {
    const { userId } = useParams();
    const [user, setUser] = useState({});
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
       
        <div className='row' ref={pdfRef}>
           
            <div className='col-lg-12' style={{textAlign:'center'}}>
               <img style={{height:'100px',width:'110px',borderRadius:'50%'}} src={user?.imageurl} alt="User Profile Image" size="md" />
            </div>
    
            <div className='col-lg-11' style={{ textAlign: 'end' }}>
                <button onClick={downloadPDF} className='btn'>
                    Download PDF
                </button>
            </div>
            
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

export default EmployeePublicProfile