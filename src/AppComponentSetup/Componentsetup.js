import React,{useState,useEffect} from "react";
import { BrowserRouter as Router, Routes, Route, Link,useNavigate  } from 'react-router-dom';
import AppHeader from '../views/layout/AppHeader';
import AppFooter from '../views/layout/AppFooter';
import Home from '../views/components/Home';
import FindJobs from '../views/components/FindJobs';
import About from '../views/components/About';
import Contact from '../views/components/Contact';
import Blog from '../views/components/Blog';
import BlogDetails from '../views/components/BlogDetails';
import Elements from '../views/components/Elements';
import JobDetails from '../views/components/JobDetails';
import DialogCompnent from '../views/layout/DialogComponent';
import { loginFun, logoutFun } from '../views/layout/authFunctions';

import CreateProfile from "../views/components/profile-create/CreateProfile";

import EmployeeDashboard from "../views/components/employee/EmployeeDashboard"; 
import EmployeeEditProfile from "../views/components/employee/profile/EmployeeEditProfile";
import EmployeeProfile from "../views/components/employee/profile/EmployeeProfile";
import EmployeeJobs from "../views/components/employee/job/EmployeeJobs";
import EmployeeJobView from "../views/components/employee/job/EmployeeJobView";
import EmployeePublicProfile from "../views/components/employee/profile/EmployeePublicProfile";

import EmployerDashboard from "../views/components/employer/EmployerDashboard";
import EmployerProfile from "../views/components/employer/profile/EmployerProfile";
import EmployerEditProfile from "../views/components/employer/profile/EmployerEditProfile";
import EmployerJobs from "../views/components/employer/job/EmployerJobs";
import EmployerJobCreate from "../views/components/employer/job/EmployerJobCreate";
import EmployerJobView from "../views/components/employer/job/EmployerJobView";
import FavouriteJobs from "../views/components/employer/job/FavouriteJobs";

const Componentsetup = ()=>{
    const navigate = useNavigate();
    const [isPopupOpen, setOpen] = useState(false); 

    const [loggedIn, setLoggedIn] = useState(() => {
      return localStorage.getItem('loggedIn') === 'true'; 
    });

    const [_token, setToken] = useState(() => {
      return localStorage.getItem('_token') || null;
    });
  
    // Initialize user state from localStorage, defaulting to null if not set
    const [user, setUser] = useState(() => {
      return JSON.parse(localStorage.getItem('user')) || '';
    });
  
    // Save login state and user to localStorage whenever they change
    useEffect(() => {
      localStorage.setItem('loggedIn', loggedIn);
      
    }, [loggedIn]);
  
    useEffect(() => {
      localStorage.setItem('user', JSON.stringify(user));
    }, [user]);

    useEffect(() => {
      localStorage.setItem('_token', _token);
    }, [_token]);
   
      const handleClickToOpen = () => {
          setOpen(true);
      };
   
      const handleToClose = () => {
          setOpen(false);
      };
  
      const login = () => {
        setOpen(false);
        loginFun(setUser,navigate,setToken);
        setLoggedIn(true);
      };
    
      const logout = () => {
        setUser(null);
        setLoggedIn(false);
        logoutFun(navigate);
      };
   return(
    <>
    
        <AppHeader onLoginClick={handleClickToOpen} loggedIn={loggedIn} user={user} logout={logout}/>
        {isPopupOpen && (
        <DialogCompnent  open={isPopupOpen} onClose={handleToClose} login={login}/>
        )}
       
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="job-listing" element={<FindJobs/>} /> 
          <Route path="about" element={<About/>} />
          <Route path="contact" element={<Contact/>} />
          <Route path="blog" element={<Blog/>} />
          <Route path="blog-details" element={<BlogDetails/>} />
          <Route path="elements" element={<Elements/>} />
          <Route path="job-details" element={<JobDetails/>} /> 
          {/* Add more routes here */}

          {/* Route not included in header menu */}
          <Route path="/create-profile" element={<CreateProfile setUser={setUser} />} />

          {/* Start Employee Routes */}

          <Route path="/employee-dashboard" element={<EmployeeDashboard/>} /> 
          <Route path="/employee-edit-profile" element={<EmployeeEditProfile user={user} setUser={setUser}/>} />
          <Route path="/employee-profile" element={<EmployeeProfile user={user} setUser={setUser} />}/>
          <Route path="/employee-jobs" element={<EmployeeJobs/>}/>
          <Route path="/employee-job-view/:jobId" element={<EmployeeJobView/>}/>
          <Route path="/employee-public-profile/:userId" element={<EmployeePublicProfile/>}/>

           {/* End Employee Routes */}
           {/* Start Employer Routes */}

          <Route path="/employer-dashboard" element={<EmployerDashboard/>} />
          <Route path="/employer-edit-profile" element={<EmployerEditProfile user={user} setUser={setUser}/>} />
          <Route path="/employer-profile" element={<EmployerProfile user={user} setUser={setUser} />}/>
          <Route path="/employer-jobs" element={<EmployerJobs/>}/>
          <Route path="/employer-job-create" element={<EmployerJobCreate/>}/>
          <Route path="/employer-job-view/:jobId" element={<EmployerJobView/>}/>
          <Route path="/favourite-jobs" element={<FavouriteJobs/>}/>

          {/* End Employer Routes */}
        </Routes>
        
        <AppFooter/>
    
    </>
   )
}

export default Componentsetup