
import './App.css';
import AppHeader from './views/layout/AppHeader';
import AppFooter from './views/layout/AppFooter';
import Home from './views/components/Home';
import { BrowserRouter as Router, Routes, Route, Link } from 'react-router-dom';
import FindJobs from './views/components/FindJobs';
import About from './views/components/About';
import Contact from './views/components/Contact';
import Blog from './views/components/Blog';
import BlogDetails from './views/components/BlogDetails';
import Elements from './views/components/Elements';
import JobDetails from './views/components/JobDetails';

import DialogCompnent from './views/layout/DialogComponent';

import React from "react";
import Dialog from "@material-ui/core/Dialog";
import DialogContentText from "@material-ui/core/DialogContentText";
import DialogTitle from "@material-ui/core/DialogTitle";
import DialogActions from "@material-ui/core/DialogActions";
import DialogContent from "@material-ui/core/DialogContent";
import Button from "@material-ui/core/Button";

function App() 
{
  const [isPopupOpen, setOpen] = React.useState(false);
 
    const handleClickToOpen = () => {
        setOpen(true);
    };
 
    const handleToClose = () => {
        setOpen(false);
    };
 
  return (
  <>
     
    <Router>
      <AppHeader onLoginClick={handleClickToOpen}/>
      {isPopupOpen && (
       <DialogCompnent  open={isPopupOpen} onClose={handleToClose}/>
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
  );
}

export default App;
