import React,{ useEffect, useState } from 'react';
import { BrowserRouter as Router, Switch, Route, Link, NavLink,useNavigate } from 'react-router-dom';
import { gapi } from 'gapi-script';
import {getClientId} from '../../apiService';

const client_id = getClientId(); 

const AppHeader = ({ onLoginClick,loggedIn,user,logout })=>{
  
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

      },[]);

      

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

                                {loggedIn ? (
                                     <div class="main-menu">
                                        <nav class="d-none d-lg-block"> 
                                            <ul id="navigation">
                                                <li>
                                                {user ? ( <img style={{height:'60px',width:'60px',borderRadius:'50%'}} src={user?.imageurl} alt="User Profile Image" size="md" />
                                                ):('')}

                                                    <ul class="submenu">
                                                    {user && user.role_id === 1 && (
                                                        <li><NavLink to="/employee-dashboard">Dashboard</NavLink></li>
                                                    )}
                                                    {user && user.role_id === 2 && (
                                                        <li><NavLink to="/employer-dashboard">Dashboard</NavLink></li>
                                                    )}
                                                    {user && user.role_id === 1 && (
                                                        <li><NavLink to="/employee-profile">Profile</NavLink></li>
                                                    )}
                                                    {user && user.role_id === 2 && (
                                                        <li><NavLink to="/employer-profile">Profile</NavLink></li>
                                                    )}
                                                    {user && user.role_id === 1 && (
                                                        <li><NavLink to="/employee-jobs">Job</NavLink></li>
                                                    )}
                                                    {user && user.role_id === 2 && (
                                                        <li><NavLink to="/employer-jobs">Job</NavLink></li>
                                                    )}
                                                        <li><button className="btn head-btn2" onClick={logout}>Logout</button></li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </nav>
                                    </div> 
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