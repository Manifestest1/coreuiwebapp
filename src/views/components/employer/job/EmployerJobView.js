import { BrowserRouter as Router, Switch, Route, useParams, NavLink,useNavigate } from 'react-router-dom';
import React,{ useEffect, useState } from 'react';
import {getJobViewEmployer} from '../../../../apiService';

const EmployerJobView = ()=>{
    const { jobId } = useParams();
    const navigate = useNavigate()
    const [job, setJob] = useState({name: '',phone: null,imageurl: null});
    const [jobPostUsers, setjobPostUsers] = useState();
    const [countjobPostUsers, setCountjobPostUsers] = useState();
    const [favJobCount, setFavJobCount] = useState();

    useEffect(() => {
        getJobViewEmployer(jobId)
        .then((r) => {
            console.log(r.data,"job view Users");
          setJob(r.data.job);
          setjobPostUsers(r.data.jobpostusers);
          setCountjobPostUsers(r.data.count);
          setFavJobCount(r.data.favjobcountuser);
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
                        <h2>Job</h2>
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
                <div className='row'>
                    <div className='col-lg-8'>
                        <h4>Job</h4>
                    </div>

                    <div className='col-lg-2'>
                       {countjobPostUsers > 0 ? (<p className="fw-bold" style={{color: '#252b60',background:'#ededed',padding:'6px', fontSize: '16px',fontWeight:700 }}>
                       Job Application<span style={{padding: '4px 9px 4px 9px',color:'white',background: '#252b60',borderRadius: '50%'}}>{countjobPostUsers}</span> </p>): ('')}
                    </div>
                </div>
               
                
           </div>
            {/* <!-- Select job items start --> */}
            <div class="select-job-items2">
            <form>
            <div className='row'>
                <div className='col-lg-2'>
                    <label className='mt-30'>Job Title</label>
                </div>
                <div className='col-lg-10'>
                    <input className="form-control mt-30" value={job.title} name="title" type="text"/>
                </div>

                <div className='col-lg-2'>
                    <label className='mt-30'>Description</label>
                </div>
                <div className='col-lg-10'>
                    <input className="form-control mt-30" value={job.description} name="description" type="text"/>
                </div>

                <div className='col-lg-2'>
                    <label className='mt-30'>Location</label>
                </div>
                <div className='col-lg-10'>
                    <input className="form-control mt-30" value={job.location} name="location" type="text"/>
                </div>
            </div>
            </form> 

           
            </div>
           
            {/* <!-- select-Categories End --> */}
            {jobPostUsers && jobPostUsers.length > 0 ?
            <table style={{textAlign:'center',marginTop:'50px'}} className="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Profile</th>
                                        <th>Name</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {jobPostUsers?.map(user => (
                                        <tr key={user.id}>
                                            <td><img style={{height:50,borderRadius:'50%'}} src={user.imageurl} /></td>
                                            <td>{user.name}</td>
                                            <td>
                                            <NavLink to={`/employee-public-profile/${user.id}`}><i style={{color:'black'}} class="fa fa-eye fa-lg"></i></NavLink>
                                            </td>
                                        </tr>
                                    ))}
                                </tbody>
                            </table>
                            : (
                                <p className="text-center fw-bold" style={{color:'#252b60',fontSize:'18px',fontWeight:700}}>No Job Post .</p>
                              )}
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

export default EmployerJobView