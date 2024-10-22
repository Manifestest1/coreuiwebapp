import React, { useEffect } from 'react';
import { NavLink } from 'react-router-dom';
import { gapi } from 'gapi-script';
import { getClientId, getJobonEmployee } from '../../apiService';
import { useDispatch, useSelector } from 'react-redux';
import { selectFavoriteJobsCount, setFavoriteJobsCount } from '../../store/favoriteJobsSlice';

const client_id = getClientId();

const AppHeader = ({ loggedIn, user, logout, login }) => {
  const favoriteJobsCount = useSelector(selectFavoriteJobsCount);
  const dispatch = useDispatch();
  const baseURL = process.env.REACT_APP_API_URL;  

  useEffect(() => {
    const token = localStorage.getItem('_token');
    if (token) {
      getJobonEmployee()
        .then((response) => {
          dispatch(setFavoriteJobsCount(response.data.userFavJob.length));
        })
        .catch((error) => {
          if (error.response && error.response.status === 401) {
            // Handle unauthorized access
          }
        });
    }
  }, [dispatch]);

  useEffect(() => {
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
  }, []);

  return (
    <header>
      <div className="header-area header-transparrent">
        <div className="headder-top header-sticky">
          <div className="container">
            <div className="row align-items-center">
              <div className="col-lg-3 col-md-2">
                <div className="logo">
                  <NavLink to="/">
                    <img src="assets/img/logo/logo.png" alt="Logo" />
                  </NavLink>  
                </div>
              </div>
              <div className="col-lg-9 col-md-9 ">
                <div className="menu-wrapper f-right">
                  <div className="main-menu">
                    <nav className="d-none d-lg-block">
                      <ul id="navigation">
                        {loggedIn && user.role_id !== null ? (
                          <>
                            <li><NavLink to="/employee-jobs">Find  Jobs</NavLink></li>
                            <li><NavLink to="/employee-details">Find Employee</NavLink></li>
                            <li>
                              <NavLink to="/">Page</NavLink>
                              <ul className="submenu">
                                <li><NavLink to="/blog">Blog</NavLink></li>
                                <li><NavLink to="/blog-details">Blog Details</NavLink></li>
                                <li><NavLink to="/elements">Elements</NavLink></li>
                                <li><NavLink to="/job-details">Job Details</NavLink></li>
                              </ul>
                            </li>
                          </>
                        ) : (
                          <>
                            <li><NavLink to="/about">About</NavLink></li>
                            <li><NavLink to="/contact">Contact</NavLink></li>
                          </>
                        )}
                      </ul>
                    </nav>
                  </div>
                  <div className="header-btn d-none f-right d-lg-block">
                    {loggedIn ? (
                      <div className="main-menu">
                        <nav className="d-none d-lg-block">
                          <ul id="navigation">
                            <li>
                              {user ? (
                                user.role_id === null ? (
                                  <img src="/download.png" size="md" height="60px" />
                                ) : (
                                  user.profile_image ? (
                                    <img id='imagebaseurl' src={`${baseURL}/uploads/${user.profile_image}`}  alt="Profile" className="profile-image" />
                                ) : (
                                    <img id='imageurl' src="/download.png"  alt="Default Profile" className="profile-image" />
                                )
                                )
                              ) : null}
                              <ul className="submenu" id='appheader-submenu'>
                                {user && user.role_id === null && (
                                    <li><NavLink to="/create-profile">Create Profile</NavLink></li>
                                )}
                                {user && user.role_id === 1 && (
                                  <>
                                    <li><NavLink to="/employee-profile">My Profile</NavLink></li>
                                    <li><NavLink to="/favourite-jobs">Like Jobs - {favoriteJobsCount}</NavLink></li>
                                  </>
                                )}
                                {user && user.role_id === 2 && (
                                  <>
                                    <li><NavLink to="/employer-profile">My Profile</NavLink></li>
                                    <li><NavLink to="/employer-jobs">Jobs</NavLink></li>
                                  </>
                                )}
                                <li><NavLink id='logout-button' onClick={logout}>Logout</NavLink></li>
                              </ul>
                            </li>
                          </ul>
                        </nav>
                      </div>
                    ) : (
                        <button className="genric-btn success-border radius" onClick={login}>Login</button>
                    )}
                  </div>
                </div>
              </div>
              <div className="col-12">
                <div className="mobile_menu d-block d-lg-none"></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </header>
  );
}

export default AppHeader;
