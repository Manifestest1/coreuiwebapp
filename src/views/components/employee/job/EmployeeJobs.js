import { useState, useEffect } from 'react';
import { NavLink } from 'react-router-dom';
import { getJobonEmployee, searchJobGet, favrouiteJOb } from '../../../../apiService';

const EmployeeJobs = () => {
  const [searchTerm, setSearchTerm] = useState('');
  const [searchResults, setSearchResults] = useState([]);
  const [jobResults, setJobResults] = useState([]); 
  const [favJobResults, setFavJobResults] = useState([]); 
  const [likedJobs, setLikedJobs] = useState(new Set());

  const handleLike = (jobId) => {
    if (likedJobs.has(jobId)) {
      likedJobs.delete(jobId);
    } else {
      likedJobs.add(jobId);
    }
    setLikedJobs(new Set(likedJobs));
    favrouiteJOb(jobId)
    .then((r) => {
         setFavJobResults((prevFavJobResults) => [...prevFavJobResults, r.data]);

        console.log(jobId,"favjob like")

    })
    .catch((e) => {
        if(e.response.status == 401)
        {
           
        }
    });
  }

  const handleChange = (e) => {
    setSearchTerm(e.target.value);
  };

  const handleSearch = (e) => {
    e.preventDefault();
    const formData = new FormData();
    formData.append('keyword', searchTerm);
    searchJobGet(formData)
      .then((response) => {
        setSearchResults(response.data);
      })
      .catch((error) => {
        console.error('Job Post error', error); 
      });
  };

  useEffect(() => {
    getJobonEmployee()
      .then((response) => {
        setSearchResults(response.data.job);
        setJobResults(response.data.userJobPosts);
        setFavJobResults(response.data.userFavJob);
      })
      .catch((error) => {
        if (error.response.status === 401) {
          // Handle unauthorized access
        }
      });
  }, []);

  const isJobInUserPosts = (jobId) => {
    return jobResults.some((userJob) => userJob.id === jobId);
  };

  const isFavJobInUser = (jobId, status) => {
    return favJobResults.some((userJob) => userJob.id === jobId && userJob.pivot.job_like === status);
  };
  const favJob = (jobId)=> {
    console.log(jobId,"check fun")
   
    favrouiteJOb(jobId)
    .then((r) => {
         // Assuming setFavJobResults is a function to update the state with the new favorite job
         setFavJobResults((prevFavJobResults) => [...prevFavJobResults, r.data]);

        //getJobonEmployee();
        console.log(jobId,"test")

    })
    .catch((e) => {
        if(e.response.status == 401)
        {
           
        }
    });
  }

  return (
    <>
      <main>
        <div class="slider-area ">
          <div class="single-slider section-overly slider-height2 d-flex align-items-center" style={{ backgroundImage: `url(assets/img/hero/about.jpg)` }}>
            <div class="container">
              <div class="row">
<<<<<<< Updated upstream
                <div class="col-lg-12 col-md-12">
                  <div class="job-category-listing mb-50">
                    <div class="single-listing">
                      <div class="select-job-items2">
                        <form onSubmit={handleSearch}>
                          <div className='row'>
                            <div className='col-lg-10'>
                            <input style={{height:50,marginTop:'4px'}} type="text" className="form-control" placeholder="Search job title or location..." onChange={handleChange} name="keyword"/>
                            </div>
                            <div className='col-lg-2'>
                                <button type='submit' className='btn'>Find Jobs</button>
                            </div>
                           
                            <table style={{textAlign:'center',marginTop:'50px'}} className="table table-striped">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Job</th>
                                        <th>Location</th>
                                        <th>Description</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {searchResults.map(job => ( 
                                        <tr key={job.id}>
                                            <td>{job.id}</td>
                                            <td>
                                              <NavLink style={{color:'black'}}to={`/employee-job-view/${job.id}`}>{job.title}</NavLink>
                                          </td>
                                            <td>{job.location}</td>
                                            <td>{job.description}</td>
                                            {isJobInUserPosts(job.id) ?<td style={{color:'green'}}>APPLIED</td> :  
                                            <td><NavLink to={`/employee-job-view/${job.id}`}><i style={{color:'black'}} class="fa fa-eye fa-lg"></i></NavLink></td>
                                            }
                                            
                                            {/* <td onClick={()=>favJob(job.id)}><i style={{color:'black'}}class="fa fa-heart" aria-hidden="true"></i></td> */}
                                            {isFavJobInUser(job.id,"1") ?<td onClick={() => favJob(job.id)}><i style={{ color: 'red' }} class="fa fa-heart" aria-hidden="true"></i></td> :
                                              <td onClick={() => favJob(job.id)}>
                                                <i style={{ color: 'black' }} class="fa fa-heart" aria-hidden="true"></i>
                                              </td>
                                            }
=======
                <div class="col-xl-12">
                  <div class="hero-cap text-center">
                    <h2>Employee Jobs</h2>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
>>>>>>> Stashed changes

        <div class="job-listing-area pt-120 pb-120">
          <div class="container">
            <div class="row">
              <div class="col-lg-12 col-md-12">
                <div class="job-category-listing mb-50">
                  <div class="single-listing">
                    <div class="select-job-items2">
                      <form onSubmit={handleSearch}>
                        <div className='row'>
                          <div className='col-lg-10'>
                            <input style={{ height: 50, marginTop: '4px' }} type="text" className="form-control" placeholder="Search job title or location..." value={searchTerm} onChange={handleChange} />
                          </div>
                          <div className='col-lg-2'>
                            <button type='submit' className='btn'>Find Jobs</button>
                          </div>

                          <table style={{ textAlign: 'center', marginTop: '50px' }} className="table table-striped">
                            <thead>
                              <tr>
                                <th>ID</th>
                                <th>Job</th>
                                <th>Location</th>
                                <th>Description</th>
                                <th>Action</th>
                              </tr>
                            </thead>
                            <tbody>
                              {searchResults.map(job => (
                                <tr key={job.id}>
                                  <td>{job.id}</td>
                                  <td>
                                    <NavLink style={{ color: 'black' }} to={`/employee-job-view/${job.id}`}>{job.title}</NavLink>
                                  </td>
                                  <td>{job.location}</td>
                                  <td>{job.description}</td>
                                  <td>
                                    {isJobInUserPosts(job.id) ? <span style={{ color: 'green' }}>APPLIED</span> :
                                      <NavLink to={`/employee-job-view/${job.id}`}><i style={{ color: 'black' }} class="fa fa-eye fa-lg"></i></NavLink>
                                    }
                                    <i style={{ color: likedJobs.has(job.id) ? 'red' : 'black' }} className="fa fa-heart" onClick={() => handleLike(job.id)}></i>
                                  </td>
                                </tr>
                              ))}
                            </tbody>
                          </table>
                        </div>
                      </form>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </main>
    </>
  );
}

export default EmployeeJobs;
