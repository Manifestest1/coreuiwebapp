import { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { getJobonEmployee, getUserProfile } from '../../../../apiService'; 
import FilterJob from './FilterJob';

const EmployeeJobs = () => {
    const [jobResults, setJobResults] = useState([]);
    const [currentPage, setCurrentPage] = useState(1);
    const jobsPerPage = 14;
    const [filteredJobs, setFilteredJobs] = useState([]);
    const [filters, setFilters] = useState({
        location: '',
        experience: '',
        jobTitle: '',
        education: '',
        postedWithin: '',
        companyType: [],
        jobType: [],
        industry: [],
        duration: [],
        department: []
    });
    
    const [userId, setUserId] = useState(null); 
    const [roleId, setRoleId] = useState(null);
    const [isDataLoaded, setIsDataLoaded] = useState(false); 
    const navigate = useNavigate();
    const baseURL = process.env.REACT_APP_URL; 

    useEffect(() => {
        const token = localStorage.getItem('_token');
        if (token) {
            getJobonEmployee()
                .then((response) => {
                    const jobs = response.data.job || []; 
                    setJobResults(jobs);
                    setFilteredJobs(jobs);

                    const jobWithUserDetails = jobs.map((job) => {
                        const user = job.postedby || null; 
                        return {
                            ...job, 
                            name: user ? user.name : 'No User', 
                            imageurl: user && user.profile_image 
                                ? `${baseURL}${user.profile_image}` 
                                : '/download.png', 
                        };
                    });
                    
                    setFilteredJobs(jobWithUserDetails);
                })
                .catch((error) => {
                    console.error('Error fetching jobs:', error);
            });
            getUserProfile()
                .then((response) => {
                    const user = response.data;
                    if (user && user.id && user.role_id) {
                        setUserId(user.id);
                        setRoleId(user.role_id);
                        setIsDataLoaded(true); 
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
        if (isDataLoaded) {
            const filtered = jobResults.filter((job) => {
                const hasFilters = Object.values(filters).some(filter => 
                    Array.isArray(filter) ? filter.length > 0 : filter !== ''
                );
                if (!hasFilters) return true;
    
                const matchLocation = filters.location ? job.location === filters.location : true;
                const matchExperience = filters.experience ? job.description.includes(filters.experience) : true;
                const matchJobTitle = filters.jobTitle ? job.title.includes(filters.jobTitle) : true;
                const matchEducation = filters.education ? job.education.includes(filters.education) : true;
                const matchPostedWithin = filters.postedWithin ? job.posted_within.includes(filters.postedWithin) : true;
                const matchCompanyType = filters.companyType.length > 0 ? filters.companyType.includes(job.company_type) : true;
                const matchJobType = filters.jobType.length > 0 ? filters.jobType.includes(job.job_type) : true;
                const matchIndustry = filters.industry.length > 0 ? filters.industry.includes(job.industry) : true;
                const matchDuration = filters.duration.length > 0 ? filters.duration.includes(job.duration) : true;
                const matchDepartment = filters.department.length > 0 ? filters.department.includes(job.department) : true;
    
                return matchLocation && matchExperience && matchJobTitle && matchIndustry && matchDuration && matchDepartment && matchCompanyType && matchJobType && matchEducation && matchPostedWithin;
            });
            
            setFilteredJobs(filtered);
        }
    }, [filters, jobResults, isDataLoaded]);
    

    const uniqueLocations = [...new Set(jobResults.map(job => job.location))];
    const uniqueExperiences = [...new Set(jobResults.map(job => job.description))];
    const uniqueJobTitle = [...new Set(jobResults.map(job => job.title))];
    const uniqueEducation  = [...new Set(jobResults.map(job => job.education ))];
    const uniquePostedWithin = [...new Set(jobResults.map(job => job.posted_within ))];
    const uniqueJobType = [...new Set(jobResults.map(job => job.job_type))];
    const uniqueCompanyType = [...new Set(jobResults.map(job => job.company_type))];
    const uniqueDepartment = [...new Set(jobResults.map(job => job.department))];
    const uniqueDuration = [...new Set(jobResults.map(job => job.duration))];
    const uniqueIndustry = [...new Set(jobResults.map(job => job.industry))];

    const handleFilterChange = (filterName, value) => {
        setFilters(prevFilters => ({
            ...prevFilters,
            [filterName]: value,
            ...(filterName === 'location' ? { experience: '',education: '', jobTitle: '', postedWithin: '', companyType: [], jobType: [], industry: [], duration: [], department: [] } : {}),
            ...(filterName === 'education' ? { experience: '',location: '', jobTitle: '', postedWithin: '', companyType: [], jobType: [], industry: [], duration: [], department: [] } : {}),
            ...(filterName === 'experience' ? { location: '', jobTitle: '',education: '', postedWithin: '', companyType: [], jobType: [], industry: [], duration: [], department: [] } : {}),
            ...(filterName === 'jobTitle' ? { location: '', experience: '',education: '', postedWithin: '', companyType: [], jobType: [], industry: [], duration: [], department: [] } : {}),
            ...(filterName === 'companyType' ? { location: '', experience: '',education: '', postedWithin: '', jobTitle: '', jobType: [], industry: [], duration: [], department: []  } : {}),
            ...(filterName === 'postedWithin' ? { location: '', experience: '',education: '', jobTitle: '' ,companyType: [], jobType: [], industry: [], duration: [], department: [] } : {}),
            ...(filterName === 'jobType' ? { location: '', experience: '',education: '', jobTitle: '' ,postedWithin: '', companyType: [], industry: [], duration: [], department: [] } : {}),
            ...(filterName === 'industry' ? { location: '', experience: '',education: '', jobTitle: '' ,postedWithin: '',companyType: [], jobType: [], duration: [], department: [] } : {}),
            ...(filterName === 'duration' ? { location: '', experience: '',education: '', jobTitle: '' ,postedWithin: '',companyType: [], jobType: [], industry: [], department: [] } : {}),
            ...(filterName === 'department' ? { location: '', experience: '',education: '', jobTitle: '' ,postedWithin: '',companyType: [], jobType: [], industry: [], duration: [] } : {}),
        }));
    };

    const handleCompanyTypeChange = (value) => {
        setFilters(prevFilters => {
            const updatedCompanyTypes = prevFilters.companyType.includes(value)
                ? prevFilters.companyType.filter(type => type !== value)
                : [...prevFilters.companyType, value];
            return { ...prevFilters, companyType: updatedCompanyTypes };
        });
    };

    const handleJobTypeChange = (value) => {
        setFilters(prevFilters => {
            const updatedJobTypes = prevFilters.jobType.includes(value)
                ? prevFilters.jobType.filter(type => type !== value)
                : [...prevFilters.jobType, value];
            return { ...prevFilters, jobType: updatedJobTypes };
        });
    };

    const handleIndustryChange = (value) => {
        setFilters(prevFilters => {
            const updatedIndustry = prevFilters.industry.includes(value)
                ? prevFilters.industry.filter(type => type !== value)
                : [...prevFilters.industry, value];
            return { ...prevFilters, industry: updatedIndustry };
        });
    };

    const handleDurationChange = (value) => {
        setFilters(prevFilters => {
            const updatedDuration = prevFilters.duration.includes(value)
                ? prevFilters.duration.filter(type => type !== value)
                : [...prevFilters.duration, value];
            return { ...prevFilters, duration: updatedDuration };
        });
    };

    const handleDepartmentChange = (value) => {
        setFilters(prevFilters => {
            const updatedDepartment = prevFilters.department.includes(value)
                ? prevFilters.department.filter(type => type !== value)
                : [...prevFilters.department, value];
            return { ...prevFilters, department: updatedDepartment };
        });
    };

    const handleJobClick = (jobId) => {
        if (userId && roleId) {
            navigate(`/${roleId === 1 ? 'employee-job-view' : 'employer-job-view'}/${jobId}`);
        } else {
            console.error("Cannot navigate: User ID or Role ID is null");
        }
    };
 
    const totalPages = Math.ceil(filteredJobs.length / jobsPerPage);
    const pageNumbers = Array.from({ length: totalPages }, (_, i) => i + 1);
    const indexOfLastJob = currentPage * jobsPerPage;
    const indexOfFirstJob = indexOfLastJob - jobsPerPage;
    const currentJobs = filteredJobs.slice(indexOfFirstJob, indexOfLastJob);

    const handlePageClick = (pageNumber) => {
        setCurrentPage(pageNumber);
    };

    if (!isDataLoaded) {
        return <div>Loading...</div>;
    }

    return (
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
                            <FilterJob 
                                uniqueLocations={uniqueLocations} 
                                uniqueJobTitle={uniqueJobTitle} 
                                uniqueEducation={uniqueEducation} 
                                uniqueExperiences={uniqueExperiences} 
                                uniquePostedWithin={uniquePostedWithin} 
                                uniqueCompanyType={uniqueCompanyType} 
                                uniqueJobType={uniqueJobType}
                                uniqueIndustry={uniqueIndustry}
                                uniqueDepartment={uniqueDepartment}
                                uniqueDuration={uniqueDuration}
                                onLocationChange={(e) => handleFilterChange('location', e.target.value)}  
                                onExperienceChange={(e) => handleFilterChange('experience', e.target.value)}
                                onJobTitleChange={(e) => handleFilterChange('jobTitle', e.target.value)}
                                onEducationChange={(e) => handleFilterChange('education', e.target.value)}
                                onPostedWithinChange={(e) => handleFilterChange('postedWithin', e.target.value)}
                                onCompanyTypeChange={handleCompanyTypeChange}
                                onDepartmentChange={handleDepartmentChange}
                                onJobTypeChange={handleJobTypeChange}
                                onIndustryChange={handleIndustryChange}
                                onDurationChange={handleDurationChange}
                                jobCount={filteredJobs.length}
                            />
                            <div className="col-xl-9 col-lg-9 col-md-8">
                                <section className="featured-job-area">
                                    <div className="container">
                                        <div className="row">
                                            <div className="col-lg-12">
                                                <div className="count-job mb-10">
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
                                        {filteredJobs.length > 0 ? (
                                            currentJobs.map((job, index) => (
                                                <div className="single-job-items mb-30" key={job.id} data-index={index}>
                                                    <div className="job-items">
                                                        <div className="company-img">
                                                            <a href="#"><img src={job.profile_image} height="80" width="68" alt={job.name} /></a>
                                                        </div>
                                                        <div className="job-tittle job-tittle2">
                                                            <div 
                                                                className="nav-link-style applycursor"  
                                                                onClick={() => handleJobClick(job.id)} 
                                                            >
                                                                <h4>{job.title}</h4>
                                                                <h6>{job.name}</h6>
                                                            </div>
                                                            <ul>
                                                                <li>{job.company_type}</li>
                                                                <li><i className="fas fa-map-marker-alt"></i>{job.location}</li>
                                                                <li>{job.salary}</li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <div className="items-link items-link2 f-right">
                                                        <a href="job_details.html">{job.job_type}</a>
                                                        <span>{job.posted_within}</span>
                                                    </div>
                                                </div>
                                            ))
                                        ) : (
                                            <p>No jobs found</p>
                                        )}
                                    </div>
                                </section>
                            </div>
                        </div>
                    </div>
                </div>
 {/* Render pagination */}
 <div className="pagination-area pb-115 text-center">
                <div className="container">
                    <div className="row">
                        <div className="col-xl-12">
                            <div className="single-wrap d-flex justify-content-center">
                                <nav aria-label="Page navigation example">
                                    <ul className="pagination justify-content-start">
                                        {/* Previous button */}
                                        {currentPage > 1 && (
                                            <li className="page-item">
                                                <a 
                                                    className="page-link" 
                                                    href="#!" 
                                                    onClick={() => handlePageClick(currentPage - 1)}
                                                >
                                                    <span className="ti-angle-left"></span>
                                                </a>
                                            </li>
                                        )}

                                        {/* Render page numbers */}
                                        {pageNumbers.map((number) => (
                                            <li key={number} className={`page-item ${currentPage === number ? 'active' : ''}`}>
                                                <a 
                                                    className="page-link" 
                                                    href="#!" 
                                                    onClick={() => handlePageClick(number)}
                                                >
                                                    {number}
                                                </a>
                                            </li>
                                        ))}

                                        {/* Next button */}
                                        {currentPage < totalPages && (
                                            <li className="page-item">
                                                <a 
                                                    className="page-link" 
                                                    href="#!" 
                                                    onClick={() => handlePageClick(currentPage + 1)}
                                                >
                                                    <span className="ti-angle-right"></span>
                                                </a>
                                            </li>
                                        )}
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
