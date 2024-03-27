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

import EmployerDashboard from "../views/components/employer/EmployerDashboard";
import EmployerProfile from "../views/components/employer/profile/EmployerProfile";
import EmployerEditProfile from "../views/components/employer/profile/EmployerEditProfile";

const Componentsetup = ()=>{
    const navigate = useNavigate();
    const [isPopupOpen, setOpen] = useState(false);

    const [loggedIn, setLoggedIn] = useState(() => {
      return localStorage.getItem('loggedIn') === 'true';
    });
  
    // Initialize user state from localStorage, defaulting to null if not set
    const [user, setUser] = useState(() => {
      return JSON.parse(localStorage.getItem('user')) || null;
    });
  
    // Save login state and user to localStorage whenever they change
    useEffect(() => {
      localStorage.setItem('loggedIn', loggedIn);
      
    }, [loggedIn]);
  
    useEffect(() => {
      localStorage.setItem('user', JSON.stringify(user));
    }, [user]);
   
      const handleClickToOpen = () => {
          setOpen(true);
      };
   
      const handleToClose = () => {
          setOpen(false);
      };
  
      const login = () => {
        setOpen(false);
        loginFun(setUser,navigate);
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
          <Route path="job_listing" element={<FindJobs/>} />
          <Route path="about" element={<About/>} />
          <Route path="contact" element={<Contact/>} />
          <Route path="blog" element={<Blog/>} />
          <Route path="blog-details" element={<BlogDetails/>} />
          <Route path="elements" element={<Elements/>} />
          <Route path="job_details" element={<JobDetails/>} />
          {/* Add more routes here */}

          {/* Route not included in header menu */}
          <Route path="/create-profile" element={<CreateProfile/>} />

          {/* Start Employee Routes */}

          <Route path="/employee-dashboard" element={<EmployeeDashboard/>} />
          <Route path="/employee-edit-profile" element={<EmployeeEditProfile/>} />
          <Route path="/employee-profile" element={<EmployeeProfile/>}/>

           {/* End Employee Routes */}
           {/* Start Employer Routes */}

          <Route path="/employer-dashboard" element={<EmployerDashboard/>} />
          <Route path="/employer-edit-profile" element={<EmployerEditProfile/>} />
          <Route path="/employer-profile" element={<EmployerProfile/>}/>
          
          {/* End Employer Routes */}
        </Routes>
        
        <AppFooter/>
    
    </>
   )
}

export default Componentsetup