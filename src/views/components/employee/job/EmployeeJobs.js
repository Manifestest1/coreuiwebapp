import { useState, useEffect } from 'react';
import { NavLink, useNavigate } from 'react-router-dom';
import { getJobonEmployee, getUserProfile } from '../../../../apiService'; // Assuming this API returns employee role_id

const EmployeeJobs = () => {
    const [jobResults, setJobResults] = useState([]);
    const [filteredJobs, setFilteredJobs] = useState([]);
    const [selectedLocation, setSelectedLocation] = useState('');
    const [selectedExperience, setSelectedExperience] = useState('');
    const [userId, setUserId] = useState(null); 
    const [roleId, setRoleId] = useState(null);
    const [isDataLoaded, setIsDataLoaded] = useState(false); // Define state for data loading

    const navigate = useNavigate();

    useEffect(() => {
        const token = localStorage.getItem('_token');
        if (token) {
            // Fetch jobs
            getJobonEmployee()
                .then((response) => {
                    const jobs = response.data.job;
                    setJobResults(jobs);
                    setFilteredJobs(jobs);
                })
                .catch((error) => {
                    console.error('Error:', error);
                });

            // Fetch user profile
            getUserProfile()
                .then((response) => {
                    const user = response.data;
                    if (user && user.id && user.role_id) {
                        setUserId(user.id);
                        setRoleId(user.role_id);
                        setIsDataLoaded(true); // Set data as loaded
                    } else {
                        console.error('User profile data is missing id or role_id');
                    }
                })
                .catch((error) => {
                    console.error('Error fetching user profile:', error);
                });
        }
    }, []);

    useEffect(() => {
        if (isDataLoaded) { // Ensure filtering only after data is loaded
            const filtered = jobResults.filter((job) => {
                const matchLocation = selectedLocation ? job.location === selectedLocation : true;
                const matchExperience = selectedExperience ? job.description.includes(selectedExperience) : true;
                return matchLocation && matchExperience;
            });
            setFilteredJobs(filtered);
        }
    }, [selectedLocation, selectedExperience, jobResults, isDataLoaded]);

    const uniqueLocations = [...new Set(jobResults.map(job => job.location))];
    const uniqueExperiences = [...new Set(jobResults.map(job => job.description))];

    const handleLocationChange = (e) => {
        setSelectedLocation(e.target.value);
    };

    const handleExperienceChange = (e) => {
        setSelectedExperience(e.target.value);
    };

    const handleJobClick = (jobId) => {
        console.log("Clicked job ID:", jobId);
        console.log("User ID:", userId);
        console.log("Role ID:", roleId);

        if (userId && roleId) {
            if (roleId === 1) {
                navigate(`/employee-job-view/${jobId}/${userId}`);
            } else {
                navigate(`/employer-job-view/${jobId}/${userId}`);
            }
        } else {
            console.error("Cannot navigate: User ID or Role ID is null");
        }
    };

    // Ensure data is loaded before rendering jobs
    if (!isDataLoaded) {
        return <div>Loading...</div>;
    }

    return(
        <>
            <main>
                <div className="slider-area">
                    <div className="single-slider section-overly slider-height2 d-flex align-items-center single-slider-contact">
                        <div className="container">
                            <div className="row">
                                <div className="col-xl-12">
                                    <div className="hero-cap text-center">
                                        <h2>Find your job</h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div className="job-listing-area pt-120 pb-120">
                    <div className="container">
                        <div className="row">
                            <div className="col-xl-3 col-lg-3 col-md-4">
                                <div className="row">
                                    <div className="col-12">
                                        <div className="small-section-tittle2 mb-45">
                                            <div className="ion"></div>
                                            <h4>Filter Jobs</h4>
                                        </div>
                                    </div>
                                </div>
                                <div className="job-category-listing mb-50">
                                    <div className="single-listing">
                                        <div className="small-section-tittle2">
                                            <h4>Company Type</h4>
                                        </div>
                                        <div className="select-job-items2">
                                            <select name="select">
                                                <option value="">All</option>
                                                <option value="">Category 1</option>
                                                <option value="">Category 2</option>
                                                <option value="">Category 3</option>
                                                <option value="">Category 4</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div className="single-listing">
                                        <div className="select-Categories pt-50 pb-50">
                                            <div className="small-section-tittle2">
                                                <h4>Job Type</h4>
                                            </div>
                                            <label className="container">Full Time
                                                <input type="checkbox" />
                                                <span className="checkmark"></span>
                                            </label>
                                            <label className="container">Part Time
                                                <input type="checkbox" checked="checked active" />
                                                <span className="checkmark"></span>
                                            </label>
                                            <label className="container">Remote
                                                <input type="checkbox" />
                                                <span className="checkmark"></span>
                                            </label>
                                            <label className="container">Freelance
                                                <input type="checkbox" />
                                                <span className="checkmark"></span>
                                            </label>
                                        </div>
                                    </div>
                                    <div className="single-listing">
                                        <div className="job-category-listing mb-50">
                                            <div className="single-listing">
                                            <div className="small-section-tittle2">
                                                <h4>Job Location</h4>
                                            </div>
                                                <div className="select-job-items2">
                                                    <select onChange={handleLocationChange}>
                                                    <option value="">All Locations</option>
                                                        {uniqueLocations.map((location, index) => (
                                                            <option key={index} value={location}>{location}</option>
                                                        ))}
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div className="single-listing">
                                            <div className="select-Categories pt-50 pb-50">
                                                <div className="small-section-tittle2">
                                                    <h4>Department</h4>
                                                </div>
                                                <label className="container">1
                                                    <input type="checkbox" />
                                                    <span className="checkmark"></span>
                                                </label>
                                                <label className="container">2
                                                    <input type="checkbox" checked="checked active" />
                                                    <span className="checkmark"></span>
                                                </label>
                                                <label className="container">3
                                                    <input type="checkbox" />
                                                    <span className="checkmark"></span>
                                                </label>
                                                <label className="container">4
                                                    <input type="checkbox" />
                                                    <span className="checkmark"></span>
                                                </label>
                                            </div>
                                        </div>
                                        <div className="single-listing">
                                            <div className="job-category-listing mb-50">
                                                <div className="small-section-tittle2">
                                                    <h4>Experience</h4>
                                                </div>
                                                <div className="select-job-items2">
                                                    <select onChange={handleExperienceChange}>
                                                        <option value="">Select Experience</option>
                                                        {uniqueExperiences.map((experience, index) => (
                                                            <option key={index} value={experience}>{experience} Years</option>
                                                        ))}
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div className="single-listing">
                                        <div className="select-Categories pt-50 pb-50">
                                            <div className="small-section-tittle2">
                                                <h4>Posted Within</h4>
                                            </div>
                                            <label className="container">Any
                                                <input type="checkbox" />
                                                <span className="checkmark"></span>
                                            </label>
                                            <label className="container">Today
                                                <input type="checkbox" checked="checked active" />
                                                <span className="checkmark"></span>
                                            </label>
                                            <label className="container">Last 2 days
                                                <input type="checkbox" />
                                                <span className="checkmark"></span>
                                            </label>
                                            <label className="container">Last 3 days
                                                <input type="checkbox" />
                                                <span className="checkmark"></span>
                                            </label>
                                            <label className="container">Last 5 days
                                                <input type="checkbox" />
                                                <span className="checkmark"></span>
                                            </label>
                                            <label className="container">Last 10 days
                                                <input type="checkbox" />
                                                <span className="checkmark"></span>
                                            </label>
                                        </div>
                                    </div>
                                    <div className="job-category-listing mb-50">
                                        <div className="single-listing">
                                            <div className="small-section-tittle2">
                                                <h4>Department</h4>
                                            </div>
                                            <div className="select-job-items2">
                                                <select >
                                                <option value="">All Department</option>
                                                        <option  >Engineering</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div className="single-listing">
                                        <div className="select-Categories pb-50">
                                            <div className="small-section-tittle2">
                                                <h4>Stipend</h4>
                                            </div>
                                            <label className="container">Any
                                                <input type="checkbox" />
                                                <span className="checkmark"></span>
                                            </label>
                                            <label className="container">unpaid
                                                <input type="checkbox" checked="checked active" />
                                                <span className="checkmark"></span>
                                            </label>
                                            <label className="container">10k
                                                <input type="checkbox" />
                                                <span className="checkmark"></span>
                                            </label>
                                        </div>
                                    </div>
                                    <div className="job-category-listing mb-50">
                                        <div className="single-listing">
                                            <div className="small-section-tittle2">
                                                <h4>Job Title</h4>
                                            </div>
                                            <div className="select-job-items2">
                                                <select >
                                                <option value="">All</option>
                                                        <option  >Engineering</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div className="single-listing">
                                        <div className="select-Categories pb-50">
                                            <div className="small-section-tittle2">
                                                <h4>Duration</h4>
                                            </div>
                                            <label className="container">1 Month
                                                <input type="checkbox" />
                                                <span className="checkmark"></span>
                                            </label>
                                            <label className="container">2 Month
                                                <input type="checkbox" checked="checked active" />
                                                <span className="checkmark"></span>
                                            </label>
                                            <label className="container">3 Month
                                                <input type="checkbox" />
                                                <span className="checkmark"></span>
                                            </label>
                                        </div>
                                    </div>
                                    <div className="job-category-listing mb-50">
                                        <div className="single-listing">
                                            <div className="small-section-tittle2">
                                                <h4>Education</h4>
                                            </div>
                                            <div className="select-job-items2">
                                                <select >
                                                <option value="">All</option>
                                                        <option  >MBBS</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div className="single-listing">
                                        <div className="select-Categories pb-50">
                                            <div className="small-section-tittle2">
                                                <h4>Posted By</h4>
                                            </div>
                                            <label className="container">1 Month
                                                <input type="checkbox" />
                                                <span className="checkmark"></span>
                                            </label>
                                            <label className="container">2 Month
                                                <input type="checkbox" checked="checked active" />
                                                <span className="checkmark"></span>
                                            </label>
                                            <label className="container">3 Month
                                                <input type="checkbox" />
                                                <span className="checkmark"></span>
                                            </label>
                                        </div>
                                    </div>
                                    <div className="job-category-listing mb-50">
                                        <div className="single-listing">
                                            <div className="small-section-tittle2">
                                                <h4>Industry</h4>
                                            </div>
                                            <div className="select-job-items2">
                                                <select >
                                                <option value="">All</option>
                                                        <option  >1</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div className="single-listing">
                                        <aside className="left_widgets p_filter_widgets price_rangs_aside sidebar_box_shadow">
                                            <div className="small-section-tittle2">
                                                <h4>{filteredJobs.length} Jobs found</h4>
                                            </div>
                                            <div className="widgets_inner">
                                                <div className="range_item">
                                                    <input type="text" className="js-range-slider" value="" />
                                                    <div className="d-flex align-items-center">
                                                        <div className="price_text">
                                                            <p>Price :</p>
                                                        </div>
                                                        <div className="price_value d-flex justify-content-center">
                                                            <input type="text" className="js-input-from" id="amount" readOnly />
                                                            <span>to</span>
                                                            <input type="text" className="js-input-to" id="amount" readOnly />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </aside>
                                    </div>
                                </div>
                            </div>
                            <div className="col-xl-9 col-lg-9 col-md-8">
                                <section className="featured-job-area">
                                    <div className="container">
                                        <div className="row">
                                            <div className="col-lg-12">
                                            <div className="count-job mb-35">
                                                <span>{filteredJobs.length} Jobs found</span>
                                                <div className="select-job-items">
                                                <span>Sort by</span>
                                                <select name="select">
                                                    <option value="">None</option>
                                                    <option value="">job list</option>
                                                    <option value="">job list</option>
                                                    <option value="">job list</option>
                                                </select>
                                                </div>
                                            </div>
                                            </div>
                                        </div>
                                        {filteredJobs.map((job) => (
                                        <div className="single-job-items mb-30" key={job.id}>
                                            <div className="job-items">
                                                <div className="company-img">
                                                <a href="#"><img src="assets/img/icon/job-list1.png" alt="" /></a>
                                                </div>
                                                <div className="job-tittle job-tittle2">
                                                <div 
                                                    className="nav-link-style applycursor"  
                                                    onClick={() => handleJobClick(job.id)} 
                                                >
                                                    <h4>{job.title}</h4>
                                                </div>
                                                <ul>
                                                    <li>Creative Agency</li>
                                                    <li><i className="fas fa-map-marker-alt"></i>{job.location}</li>
                                                    <li>$3500 - $4000</li>
                                                </ul>
                                                </div>
                                            </div>
                                            <div className="items-link items-link2 f-right">
                                                <a href="job_details.html">Full Time</a>
                                                <span>7 hours ago</span>
                                            </div>
                                        </div>
                                    ))}
                                    </div>
                                </section>
                            </div>
                        </div>
                    </div>
                </div>
                <div className="pagination-area pb-115 text-center">
                    <div className="container">
                        <div className="row">
                            <div className="col-xl-12">
                                <div className="single-wrap d-flex justify-content-center">
                                    <nav aria-label="Page navigation example">
                                        <ul className="pagination justify-content-start">
                                            <li className="page-item active"><a className="page-link" href="#">01</a></li>
                                            <li className="page-item"><a className="page-link" href="#">02</a></li>
                                            <li className="page-item"><a className="page-link" href="#">03</a></li>
                                            <li className="page-item"><a className="page-link" href="#"><span className="ti-angle-right"></span></a></li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </>
    );
};

export default EmployeeJobs;