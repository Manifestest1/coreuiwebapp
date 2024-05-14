import { useState, useEffect,useContext } from 'react';
import { NavLink } from 'react-router-dom';
import { getJobonEmployee, searchJobGet, favrouiteJOb } from '../../../../apiService';
import { useDispatch, useSelector } from 'react-redux';
import { addFavoriteJob,removeFavoriteJob } from '../../../../store/favoriteJobsSlice';

const EmployeeJobs = () => {
  const [searchTerm, setSearchTerm] = useState('');
  const [searchResults, setSearchResults] = useState([]);  
  const [jobResults, setJobResults] = useState([]); 
  const [favJobResults, setFavJobResults] = useState([]);
   

  const dispatch = useDispatch();

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

    const token = localStorage.getItem('_token');
    if(token)
      {
    getJobonEmployee()
      .then((response) => {
        console.log(response,"GEt All Jobs");
        setSearchResults(response.data.job);
        setJobResults(response.data.userJobPosts);
        setFavJobResults(response.data.userFavJob); 
       
      })
      .catch((error) => {
        console.error('Error:', error);
      });
    }
  },[]);

  const isJobInUserPosts = (jobId) => {
    return jobResults.some((userJob) => userJob.id === jobId);
  };

  const isFavJobInUser = (jobId) => {
    return favJobResults.some((userJob) => userJob.id === jobId);
  };
  const favJob = (jobId) => {
    favrouiteJOb(jobId)
      .then((r) => {
        console.log(r, "Add Favrouite Job");
        if(r.data.pivot)
        {
            console.log("job Fav");
            // Update state immediately
            setFavJobResults((prevFavJobResults) => [...prevFavJobResults, r.data]);
            dispatch(addFavoriteJob(r.data));
        }
        else
        {
            console.log("job Remove Fav");
            const updatedFavJobResults = favJobResults.filter(job => job.id !== jobId);
            setFavJobResults(updatedFavJobResults);
            dispatch(removeFavoriteJob(r.data));
        }
      })
      .catch((e) => {
        if (e.response && e.response.status === 401) 
        {
          // Handle unauthorized error
        }
      });
};


  return (
    <>
      <main>
        <div class="slider-area ">
          <div class="single-slider section-overly slider-height2 d-flex align-items-center" style={{ backgroundImage: `url(assets/img/hero/about.jpg)` }}>
            <div class="container">
              <div class="row">
                <div class="col-xl-12">
                  <div class="hero-cap text-center">
                    <h2>Employee Jobs</h2>
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
                                    <span>
                                    {isJobInUserPosts(job.id) ? <i style={{ color: 'green' }} className="fa fa-check-circle applied-icon"></i> :
                                      <NavLink to={`/employee-job-view/${job.id}`}><i style={{ color: 'black' }} className="fa fa-briefcase"></i></NavLink>
                                    }
                                    </span>
                                    <span onClick={() => favJob(job.id)} style={{cursor:'pointer',marginLeft: '10px'}}>
                                      {isFavJobInUser(job.id) ?<i style={{ color: 'red'}} className="fa fa-heart"></i>
                                       :<i style={{ color: 'black'}} className="fa fa-heart"></i>
                                      }
                                    </span>
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
