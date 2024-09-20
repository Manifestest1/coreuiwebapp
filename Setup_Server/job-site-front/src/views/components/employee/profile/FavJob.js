import React, { useState, useEffect } from 'react';
import { employeeFavJob } from '../../../../apiService';
import { NavLink } from 'react-router-dom';

const FavJob = () => {
  const [favJobs, setFavJobs] = useState([]);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await employeeFavJob();
        console.log('API response:', response.data);

        // Ensure that favJobs is set only if it's an array
        if (Array.isArray(response.data)) {
          setFavJobs(response.data);
        } else {
          console.error('API response is not an array:', response.data);
        }
      } catch (error) {
        console.error('Error fetching favorite jobs:', error);
      }
    };
    fetchData();
  }, []);

  return (
    <main>
      <div className="slider-area">
        <div className="single-slider section-overly slider-height2 d-flex align-items-center single-slider-contact" >
          <div className="container">
            <div className="row">
              <div className="col-xl-12">
                <div className="hero-cap text-center">
                  <h2>Favourite Jobs</h2>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div className="job-listing-area pt-120 pb-120">
        <div className="container">
          <div className="row">
            <div className="col-lg-12 col-md-12">
              <div className="job-category-listing mb-50">
                <div className="single-listing">
                  <div className="select-job-items2">
                    <div className="row">
                      <div className="col-lg-12">
                        <table className="table table-striped">
                          <thead>
                            <tr>
                              <th>Serial no</th>
                              <th>Favourite Job</th>
                              <th>Location</th>
                            </tr>
                          </thead>
                          <tbody>
                            {/* Ensure favJobs is an array before mapping */}
                            {Array.isArray(favJobs) && favJobs.map((job, index) => (
                              <tr key={job.id}>
                                <td>{index + 1}</td>
                                <td className='fav-title'>
                                  <NavLink className='fav-title' to={`/employee-job-view/${job.id}`}>
                                    {job.title}
                                  </NavLink>
                                </td>
                                <td>{job.location}</td>
                              </tr>
                            ))}
                          </tbody>
                        </table>
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
  );
};

export default FavJob;
