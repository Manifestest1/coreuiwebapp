import { useNavigate } from 'react-router-dom';
import React, { useState } from 'react';
import { createUserProfile } from '../../../apiService';

const CreateProfile = ({ setUser }) => {
    const [selectedProfile, setSelectedProfile] = useState('');  
    const navigate = useNavigate();

    const handleProfileSelect = async (value) => {
        setSelectedProfile(value);
        console.log(value, 'User Profile');
    
        try {
            const response = await createUserProfile(parseInt(value));
            console.log(response.data, 'API Response');
            setUser(response.data);
            if (response.data.role_id === 1) {
                console.log(response.data, 'For Employee');
                navigate('/employee-dashboard');
            } else {
                console.log(response.data, 'For Employer');
                navigate('/employer-dashboard');
            }
        } catch (error) {
            console.error('Error submitting data:', error);
        }
    };
    

    return (
        <main>
            <div className="slider-area">
                <div className="single-slider section-overly slider-height2 d-flex align-items-center single-slider-contact">
                    <div className="container">
                        <div className="row">
                            <div className="col-xl-12">
                                <div className="hero-cap text-center">
                                    <h2>Select Profile</h2>
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
                                        <div className="small-section-tittle2">
                                            <h4>Select Profile</h4>
                                        </div>
                                        <div className="select-job-items2">
                                            <div className="row">
                                                <div className="col-lg-3"></div>
                                                <div className="col-lg-3 text-center">
                                                    <img
                                                        src="/assets/img/logo/boy.png" 
                                                        className="point" 
                                                        onClick={() => handleProfileSelect('1')}
                                                    />
                                                    <p>Employee</p>
                                                </div>
                                                <div className="col-lg-3 text-center">
                                                    <img
                                                        src="/assets/img/logo/profile.png"
                                                        className="point" 
                                                        onClick={() => handleProfileSelect('2')}
                                                    />
                                                    <p>Employer</p>
                                                </div>
                                                <div className="col-lg-3"></div>
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

export default CreateProfile;
