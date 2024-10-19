import React, { useState } from 'react';

const FilterJob = ({
    uniqueJobTitle,
    uniqueEducation,
    uniqueCompanyType,
    uniqueJobType,
    uniqueIndustry,
    uniqueDepartment,
    uniqueDuration,
    uniqueLocations,
    uniqueExperiences,
    uniquePostedWithin,
    onExperienceChange,
    onJobTitleChange,
    onLocationChange,
    onEducationChange,
    onPostedWithinChange,
    onCompanyTypeChange,
    onDepartmentChange,
    onJobTypeChange,
    onIndustryChange,
    onDurationChange,
    jobCount
}) => {
    const [selectedCompanyTypes, setSelectedCompanyTypes] = useState([]);
    const [selectedJobTypes, setSelectedJobTypes] = useState([])
    const [selectedIndustry, setSelectedIndustry] = useState([]);
    const [selectedDuration, setSelectedDuration] = useState([]);
    const [selectedDepartment, setSelectedDepartment] = useState([]);


    const handleCompanyTypeChange = (e) => {
        const value = e.target.value;
        setSelectedCompanyTypes(prev => {
            if (prev.includes(value)) {
                return prev.filter(type => type !== value);
            } else {
                return [...prev, value];
            }
        });
        onCompanyTypeChange(value);
    };

    const handleJobTypeChange = (e) => {
        const value = e.target.value;
        setSelectedJobTypes(prev => {
            if (prev.includes(value)) {
                return prev.filter(type => type !== value);
            } else {
                return [...prev, value];
            }
        });
        onJobTypeChange(value);
    };

    const handleIndustryChange = (e) => {
        const value = e.target.value;
        setSelectedIndustry(prev => {
            if (prev.includes(value)) {
                return prev.filter(type => type !== value);
            } else {
                return [...prev, value];
            }
        });
        onIndustryChange(value);
    };

    const handleDurationChange = (e) => {
        const value = e.target.value;
        setSelectedDuration(prev => {
            if (prev.includes(value)) {
                return prev.filter(type => type !== value);
            } else {
                return [...prev, value];
            }
        });
        onDurationChange(value);
    };

    const handleDepartmentChange = (e) => {
        const value = e.target.value;
        setSelectedDepartment(prev => {
            if (prev.includes(value)) {
                return prev.filter(type => type !== value);
            } else {
                return [...prev, value];
            }
        });
        onDepartmentChange(value);
    };

    return (
        <div className="col-xl-3 col-lg-3 col-md-4">
            <div className="row">
                <div className="col-12">
                    <div className="small-section-tittle2 mb-45">
                        <div className="ion"></div>
                        <h4>Filter Jobs</h4>
                    </div>
                </div>
            </div>
            <div className="job-category-listing">
                <div className="single-listing">
                    <div className="small-section-tittle2">
                        <h4>Company Type</h4>
                    </div>
                    {uniqueCompanyType.map((type, index) => (
                        <label className="container" key={index}>
                            {type}
                            <input
                                type="checkbox"
                                value={type}
                                checked={selectedCompanyTypes.includes(type)}
                                onChange={handleCompanyTypeChange}
                            />
                            <span className="checkmark"></span>
                        </label>
                    ))}
                </div>
            </div>
            
            <div className="job-category-listing">
                <div className="single-listing">
                    <div className="small-section-tittle2">
                        <h4>Job Type</h4>
                    </div>
                    {uniqueJobType.map((type, index) => (
                        <label className="container" key={index}>
                            {type}
                            <input
                                type="checkbox"
                                value={type}
                                checked={selectedJobTypes.includes(type)}
                                onChange={handleJobTypeChange}
                            />
                            <span className="checkmark"></span>
                        </label>
                    ))}
                </div>
            </div>
            <div className="job-category-listing">
                <div className="single-listing">
                    <div className="small-section-tittle2">
                        <h4>Industry</h4>
                    </div>
                    {uniqueIndustry.map((type, index) => (
                        <label className="container" key={index}>
                            {type}
                            <input
                                type="checkbox"
                                value={type}
                                checked={selectedIndustry.includes(type)}
                                onChange={handleIndustryChange}
                            />
                            <span className="checkmark"></span>
                        </label>
                    ))}
                </div>
            </div>
            <div className="job-category-listing">
                <div className="single-listing">
                    <div className="small-section-tittle2">
                        <h4>Duration</h4>
                    </div>
                    {uniqueDuration.map((type, index) => (
                        <label className="container" key={index}>
                            {type}
                            <input
                                type="checkbox"
                                value={type}
                                checked={selectedDuration.includes(type)}
                                onChange={handleDurationChange}
                            />
                            <span className="checkmark"></span>
                        </label>
                    ))}
                </div>
            </div>
            <div className="job-category-listing">
                <div className="single-listing">
                    <div className="small-section-tittle2">
                        <h4>Department</h4>
                    </div>
                    {uniqueDepartment.map((type, index) => (
                        <label className="container" key={index}>
                            {type}
                            <input
                                type="checkbox"
                                value={type}
                                checked={selectedDepartment.includes(type)}
                                onChange={handleDepartmentChange}
                            />
                            <span className="checkmark"></span>
                        </label>
                    ))}
                </div>
            </div>
            <div className="job-category-listing">
            <div className="single-listing">
                <div className="small-section-tittle2">
                    <h4>Job Location</h4>
                </div>
                <div className="select-job-items2">
                    <select onChange={onLocationChange}>
                    <option value="">All</option>
                        {uniqueLocations.map((location, index) => (
                           <option key={index} value={location}>{location}</option>
                        ))} 
                    </select>
                </div>
            </div>
        </div>
        <div className="job-category-listing">
            <div className="single-listing ">
                <div className="small-section-tittle2">
                    <h4>Posted Within</h4>
                </div>
                <div className="select-job-items2">
                <select onChange={onPostedWithinChange}>
                        <option value="">All</option>
                        {uniquePostedWithin.map((postedWithin, index) => (
                           <option key={index} value={postedWithin}>{postedWithin}</option>
                        ))}
                    </select>
                </div>
            </div>
        </div>
        <div className="job-category-listing">
            <div className="single-listing ">
                <div className="small-section-tittle2">
                    <h4>Experience</h4>
                </div>
                <div className="select-job-items2">
                    <select onChange={onExperienceChange}>
                        <option value="">All</option>
                        {uniqueExperiences.map((experience, index) => (
                            <option key={index} value={experience}>{experience} Years</option>
                        ))}
                    </select>
                </div>
            </div>
        </div>
            <div className="job-category-listing">
                <div className="single-listing">
                    <div className="small-section-tittle2">
                        <h4>Job Title</h4>
                    </div>
                    <div className="select-job-items2">
                        <select onChange={onJobTitleChange}>
                            <option value="">All Job</option>
                            {uniqueJobTitle.map((jobTitle, index) => (
                                <option key={index} value={jobTitle} >{jobTitle}</option>
                            ))}
                        </select>
                    </div>
                </div>
            </div>
            <div className="job-category-listing">
                <div className="single-listing">
                    <div className="small-section-tittle2">
                        <h4>Education</h4>
                    </div>
                    <div className="select-job-items2">
                        <select onChange={onEducationChange}>
                            <option value="">All</option>
                                {uniqueEducation.map((education, index) => (
                                <option key={index} value={education} >{education}</option>
                            ))}
                        </select>
                    </div>
                </div>
            </div>
            <div className="job-category-listing">
                <div className="single-listing">
                    <aside className="left_widgets p_filter_widgets price_rangs_aside sidebar_box_shadow">
                        <div className="small-section-tittle2">
                            <h4>{jobCount} Jobs found</h4>
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
    );
};

export default FilterJob;