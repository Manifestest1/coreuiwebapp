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
    }, []);
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
                            <div class="col-lg-12 col-md-12">
                                <div class="job-category-listing mb-50">
                                    <div class="single-listing">
                                       <div class="small-section-tittle2"> 
                                            <div className='row'>
                                                <div className='col-lg-9'>
                                                    <h4>Job</h4>
                                                </div>
                                                <div className='col-lg-3'>
                                                   {countjobPostUsers > 0 ? (<p className="fw-bold" id=''>
                                                   Job Application<span id='count-job'>{countjobPostUsers}</span> </p>): ('')}
                                                </div>
                                            </div>
                                        </div>
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
                                        {jobPostUsers && jobPostUsers.length > 0 ?
                                        <table id='job-post-users' className="table table-striped">
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
                                                        <td>
                                                         {user.imagebaseurl? <img id='employee-public' src={user.imagebaseurl + user?.imageurl} alt="User Profile Image" size="md" /> :<img id='employee-public-image' src={user?.imageurl} alt="User Profile Image" size="md" />}
                                                        </td>
                                                        <td>{user.name}</td>
                                                        <td>
                                                        <NavLink to={`/employee-public-profile/${user.id}`}><i id='employee-public-prof' class="fa fa-eye fa-lg"></i></NavLink>
                                                        </td>
                                                    </tr>
                                                ))}
                                            </tbody>
                                        </table>
                                        : (
                                            <p className="text-center fw-bold" id='employee-bold'>No Job Post .</p>
                                        )}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </>
    )
}

export default EmployerJobView