import React,{ useEffect, useContext  } from 'react';
import { BrowserRouter as Router, Switch, Route, Link, NavLink,useNavigate } from 'react-router-dom';
import { gapi } from 'gapi-script';
import {getClientId,getJobonEmployee } from '../../apiService';
import { useDispatch, useSelector } from 'react-redux';
import { selectFavoriteJobsCount, selectFavoriteJobsList, removeFavoriteJob } from '../../store/favoriteJobsSlice'; 
import { setFavoriteJobsCount} from '../../store/favoriteJobsSlice';


const client_id = getClientId(); 

const AppHeader = ({ onLoginClick, loggedIn, user, logout }) => {
  const favoriteJobsCount = useSelector(state => state.favoriteJobs.favoriteJobsCount);
  const favoriteJobsList = useSelector(selectFavoriteJobsList);
  const dispatch = useDispatch(); 

  useEffect(() => {
    const token = localStorage.getItem('_token');
    if(token)
      {
        getJobonEmployee()
        .then((response) => {
          dispatch(setFavoriteJobsCount(response.data.userFavJob.length));
        })
        .catch((error) => {
          if (error.response.status === 401) 
            {
            // Handle unauthorized access
            }
        });
      }
   
  });

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
          console.log('Google API client initialized In Logout.');
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

  return (
    <header>
      {/* Header Start */}
      <div className="header-area header-transparrent">
        <div className="headder-top header-sticky">
          <div className="container">
            <div className="row align-items-center">
              <div className="col-lg-3 col-md-2">
                {/* Logo */}
                <div className="logo">
                  <Link to="/">
                    <img src="assets/img/logo/logo.png" />
                  </Link>
                </div>
              </div>
              <div className="col-lg-9 col-md-9">
                <div className="menu-wrapper">
                  {/* Main-menu */}
                  <div className="main-menu">
                    <nav className="d-none d-lg-block">
                      <ul id="navigation">
                        <li><NavLink to="/">Home</NavLink></li>
                        <li><NavLink to="job-listing">Find a Jobs</NavLink></li>
                        <li><NavLink to="about">About</NavLink></li>
                        <li>
                          <NavLink to="/">Page</NavLink>
                          <ul className="submenu">
                            <li><NavLink to="blog">Blog</NavLink></li>
                            <li><NavLink to="blog-details">Blog Details</NavLink></li>
                            <li><NavLink to="elements">Elements</NavLink></li>
                            <li><NavLink to="job-details">Job Details</NavLink></li>
                          </ul>
                        </li>
                        <li><NavLink to="contact">Contact</NavLink></li>
                      </ul>
                    </nav>
                  </div>
                  {/* Header-btn */}
                  <div className="header-btn d-none f-right d-lg-block">
                    {loggedIn ? (
                      <div className="main-menu">
                        <nav className="d-none d-lg-block">
                          <ul id="navigation">
                          <li>
                            {user && user.role_id === 1 && (
                              <Link to="/favourite-jobs" style={{ textDecoration: 'none', position: 'relative', display: 'inline-block' }}>
                                <img style={{ height: '55px', width: '60px', marginRight: '20px' }} src="assets/img/logo/cartlogo.jpeg" alt="" className="img-fluid" />
                                <i style={{ position: 'absolute', left: '30px', top: '27%', left: '50px', fontSize: '14px' }}>{favoriteJobsCount}</i>
                              </Link>
                            )}
                          </li>
                            <li>
                              {user ? (
                                <img style={{ height: '60px', width: '60px', borderRadius: '50%' }} src={user?.imageurl} alt="User Profile Image" size="md" />
                              ) : ('')}
                              <ul className="submenu">
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
                                {user && user.role_id === null && (
                                  <li><NavLink to="/create-profile">Create Profile</NavLink></li>
                                )}
                                <li><button style={{width: '135px'}} className="btn head-btn2" onClick={logout}>Logout</button></li>
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
              {/* Mobile Menu */}
              <div className="col-12">
                <div className="mobile_menu d-block d-lg-none"></div>
              </div>
            </div>
          </div>
        </div>
      </div>
      {/* Header End */}
    </header>
  );
}

export default AppHeader;
