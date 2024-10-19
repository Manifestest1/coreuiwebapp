import React,{useState,useEffect} from "react";
import {  BrowserRouter as Router, Routes, Route, useNavigate  } from 'react-router-dom';
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
import MetaDataForm from "./MetaDataForm";

import CreateProfile from "../views/components/profile-create/CreateProfile";

import EmployeeDashboard from "../views/components/employee/EmployeeDashboard"; 
import EmployeeEditProfile from "../views/components/employee/profile/EmployeeEditProfile";
import DynamicForm from "../views/components/employee/profile/projects_file";
import CertificatesFile from "../views/components/employee/profile/CertificatesFile";
import EmployeeProfile from "../views/components/employee/profile/EmployeeProfile";
import EmployeeJobs from "../views/components/employee/job/EmployeeJobs";
import FilterJob from "../views/components/employee/job/FilterJob";
import EmployeeJobView from "../views/components/employee/job/EmployeeJobView";
import EmployeePublicProfile from "../views/components/employee/profile/EmployeePublicProfile";
import EmployeeDetails from "../views/components/employee/profile/EmployeeDetails";

import EmployerDashboard from "../views/components/employer/EmployerDashboard";
import EmployerProfile from "../views/components/employer/profile/EmployerProfile";
import EmployerEditProfile from "../views/components/employer/profile/EmployerEditProfile";
import EmployerJobs from "../views/components/employer/job/EmployerJobs";
import EmployerJobCreate from "../views/components/employer/job/EmployerJobCreate";
import EmployerJobView from "../views/components/employer/job/EmployerJobView";
import FavJob from "../views/components/employee/profile/FavJob";
import { Provider } from 'react-redux';
import store from "../store/store";
import { Description } from "@mui/icons-material";

const Componentsetup = ()=>{
    const navigate = useNavigate();

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
   
       
    
  
      const login = () => {
        loginFun(setUser,navigate,setToken,setLoggedIn); 
      };
    
      const logout = () => {
        setLoggedIn(false);
        logoutFun(navigate);
      };
   return(
    <>
      <Provider store={store}>
        <AppHeader loggedIn={loggedIn} user={user} logout={logout} login={login} />
        <MetaDataForm />
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
          <Route path="/employee-dynamic" element={<DynamicForm/>}/>
          <Route path="/employee-certificate" element={<CertificatesFile/>}/>
          <Route path="/employee-profile" element={<EmployeeProfile user={user} setUser={setUser} />}/>
          <Route path="/employee-jobs" element={<EmployeeJobs/>}/>
          <Route path="/filter-jobs" element={<FilterJob/>}/>
          <Route path="/employee-job-view/:jobId" element={<EmployeeJobView/>}/>
          <Route path="/employee-public-profile/:userId" element={<EmployeePublicProfile/>}/>
          <Route path="/favourite-jobs" element={<FavJob/>}/>
          <Route path="/employee-details" element={<EmployeeDetails/>}/>

           {/* End Employee Routes */}
           {/* Start Employer Routes */}

          <Route path="/employer-dashboard" element={<EmployerDashboard/>} />
          <Route path="/employer-edit-profile" element={<EmployerEditProfile user={user} setUser={setUser}/>} />
          <Route path="/employer-profile" element={<EmployerProfile user={user} setUser={setUser} />}/>
          <Route path="/employer-jobs" element={<EmployerJobs/>}/>
          <Route path="/employer-job-create" element={<EmployerJobCreate/>}/>
          <Route path="/employer-job-view/:jobId" element={<EmployerJobView/>}/>

          {/* End Employer Routes */}
        </Routes>
        
        <AppFooter/>
        </Provider>
        
    </>
   )
}

export default Componentsetup