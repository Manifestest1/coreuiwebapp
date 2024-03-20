import React,{ useEffect, useState } from 'react';
import { BrowserRouter as Router, Switch, Route, Link, NavLink,useNavigate } from 'react-router-dom';
import { gapi } from 'gapi-script';
import useAuth from '../../useAuth';
import {getUserProfile,logoutUserProfile,getClientId} from '../../apiService';
import { useAuthProfile } from '../../AuthContext/AuthContext';
import axiosInstance from '../../api';

const client_id = getClientId();

const AppHeader = ({ onLoginClick,_token })=>{
    const { isAuthenticated } = useAuth();
    const navigate = useNavigate()
    // const [userProfile, setUserProfile] = useState('');
    const { setUserProfile } = useAuthProfile();
  
    useEffect(() => {

        // Start For Login Google Code

        const start = () => {
          gapi.load('auth2', () => {
            gapi.auth2.init({
              client_id: client_id,
              scope: 'openid profile email',
            }).then(() => {
              console.log('Google API client initialized');
            }).catch((error) => {
              console.error('Error initializing Google API client:', error);
            });
          });
        };
    
        gapi.load('client', start);

        // End For LogIn Google Code

        // Start For LogOut Google Code

        const initGoogleAuth = async () => {
            try {
              await gapi.auth2.init({
                client_id: client_id,
                scope: 'openid profile email',
              });
              console.log('Google API client initialized');
            } 
            catch (error) 
            {
              console.error('Error initializing Google API client:', error);
            }
          };
      
          if (typeof gapi !== 'undefined' && typeof gapi.auth2 === 'object' && !gapi.auth2.getAuthInstance()) 
          {
            initGoogleAuth();
          }

        // End For LogOut Google Code

        // Get User Profile Info

        const fetchUserProfile = async () => {
          try {
            // Retrieve the authentication token from local storage
            const token = localStorage.getItem('_token');
      
            // Check if the token exists
            if (token) {
              // Include the token in the request headers
              const headers = {
                Authorization: `Bearer ${token}`
              };
      
              // Make the API request with the token included in the headers
              const response = await getUserProfile({ headers });
      
              // Set user profile data in state/context
              setUserProfile(response.data);
            } else {
              // Handle case where token is missing
              console.error('Authentication token is missing');
            }
          } catch (error) {
            // Handle errors
            console.error('Error fetching user profile:', error);
          }
        };
      
        // Call fetchUserProfile function
        fetchUserProfile();
    
        // Get User Profile Info

      });

      const handleLogout = async () => {
        try {
          const authInstance = gapi.auth2.getAuthInstance();
          await authInstance.signOut();
    
          // Clear authentication-related information
          logoutUserProfile()
            .then((r) => {
              localStorage.removeItem('_token');
              navigate("/");
            })
            .catch((e) => {
              console.error(e);
            });
    
          // Redirect to the logout page or perform other necessary actions
    
        } catch (error) {
          console.error('Error during logout:', error); 
        }
      };

return(

    <header>
    {/* <!-- Header Start --> */}
   <div class="header-area header-transparrent">
       <div class="headder-top header-sticky">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-3 col-md-2">
                        {/* <!-- Logo --> */}
                        <div class="logo">
                            <Link to="/">
                                <img src="assets/img/logo/logo.png" alt=""/>
                            </Link>
                        </div>  
                    </div>
                    <div class="col-lg-9 col-md-9">
                        <div class="menu-wrapper">
                            {/* <!-- Main-menu --> */}
                            <div class="main-menu">
                                <nav class="d-none d-lg-block">
                                    <ul id="navigation">
                                        <li><NavLink to="/">Home</NavLink></li>
                                        <li><NavLink to="job_listing">Find a Jobs </NavLink></li>
                                        <li><NavLink to="about">About</NavLink></li>
                                        <li><NavLink to="/">Page</NavLink>
                                            <ul class="submenu">
                                                <li><NavLink to="blog">Blog</NavLink></li>
                                                <li><NavLink to="blog-details">Blog Details</NavLink></li>
                                                <li><NavLink to="elements">Elements</NavLink></li>
                                                <li><NavLink to="job_details">job Details</NavLink></li>
                                            </ul>
                                        </li>
                                        <li><NavLink to="contact">Contact</NavLink></li>
                                    </ul>
                                </nav>
                            </div>          
                            {/* <!-- Header-btn --> */}
                            <div class="header-btn d-none f-right d-lg-block">

                                {isAuthenticated ? (
                                        <button className="btn head-btn2" onClick={handleLogout}>Logout</button>
                                    ) : (
                                        <button className="btn head-btn2" onClick={onLoginClick}>Login</button>
                                    )}
                            </div>
                        </div>
                    </div>
                    {/* <!-- Mobile Menu --> */}
                    <div class="col-12">
                        <div class="mobile_menu d-block d-lg-none"></div>
                    </div>
                </div>
            </div>
       </div>
   </div>
   
    {/* <!-- Header End --> */} 
</header>
     
)

}

export default AppHeader