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

const Componentsetup = ()=>{

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
        loginFun(setUser);
        setLoggedIn(true);
      };
    
      const logout = () => {
        setUser(null);
        setLoggedIn(false);
        logoutFun();
      };
   return(
    <>
    <Router>
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
        </Routes>
        <AppFooter/>
    </Router>
    </>
   )
}

export default Componentsetup