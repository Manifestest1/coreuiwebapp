import React from 'react'
import { BrowserRouter as Router, Switch, Route, Link, NavLink } from 'react-router-dom';

const AppHeader = ()=>{

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
                                <a href="#" class="btn head-btn1">Register</a>
                                <a href="#" class="btn head-btn2">Login</a>
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