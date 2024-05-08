import React, { useState, useEffect } from 'react';
import { employeeFavJob } from '../../../../apiService';

const FavJob = () => {
    const [favJobs, setFavJobs] = useState([]);
  
    useEffect(() => {
      const fetchData = async () => {
        try {
          const response = await employeeFavJob();
          setFavJobs(response.data);
          console.log(' favorite jobs:', favJobs);
        } catch (error) {
          console.error('Error fetching favorite jobs:', error);
        }
      };
  
      fetchData();
    }, []);

  return (
    <main>
      <div className="slider-area">
        <div className="single-slider section-overly slider-height2 d-flex align-items-center" style={{ backgroundImage: `url(assets/img/hero/about.jpg)` }}>
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
                        <table  className="table table-striped">
                          <thead>
                            <tr>
                              <th>Serial no</th>
                              <th>Favourite Job</th>
                            </tr>
                          </thead>
                          <tbody>
                            {favJobs.map((job, index) => (
                              <tr key={job.id}>
                                <td>{index + 1}</td>
                                <td>{job.title}</td> {/* Replace job.title with job.name or correct property name */}
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
