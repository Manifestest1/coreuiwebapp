
import React from 'react'

const AppFooter = ()=>{

    return(
        <footer>
            <div class="footer-area footer-bg footer-padding">
                <div class="container">
                    <div class="row d-flex justify-content-between">
                        <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                            <div class="single-footer-caption mb-50">
                              <div class="single-footer-caption mb-30">
                                  <div class="footer-tittle">
                                      <h4>About Us</h4>
                                      <div class="footer-pera">
                                          <p>We make our customer to think ambitiously as they can and we are making that dream beyond their desire</p>
                                     </div>
                                  </div>
                              </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-3 col-md-4 col-sm-5">
                            <div class="single-footer-caption mb-50">
                                <div class="footer-tittle">
                                    <h4>Contact Info</h4>
                                    <ul>
                                        <li>
                                        <p>Address :319 B Tulsi Nagar, Indore (MP)</p>
                                        </li>
                                        <li><a href="tel:+919111444776">Phone : 91 91114 44776</a></li>
                                        <li><a href="mailto:info@manifestinfotech.com">Email : info@manifestinfotech.com</a></li>
                                    </ul>
                                </div>
    
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-3 col-md-4 col-sm-5">
                            <div class="single-footer-caption mb-50">
                                <div class="footer-tittle">
                                    <h4>Important Link</h4>
                                    <ul>
                                        <li><a href="#"> View Project</a></li>
                                        <li><a href="/contact">Contact Us</a></li>
                                        <li><a href="#">Testimonial</a></li>
                                        <li><a href="#">Proparties</a></li>
                                        <li><a href="#">Support</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-3 col-md-4 col-sm-5">
                            <div class="single-footer-caption mb-50">
                                <div class="footer-tittle">
                                    <h4>Newsletter</h4>
                                    <div class="footer-pera footer-pera2">
                                     <p>Heaven fruitful doesn't over lesser in days. Appear creeping.</p>
                                 </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row footer-wejed justify-content-between mt-0">
                        <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                            <div class="footer-logo mb-20">
                                <a href="index.html">
                                    <img src="assets/img/logo/logo2_footer.png" alt="" />
        
                                </a>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-3 col-md-4 col-sm-5">
                            <div class="footer-tittle-bottom">
                                <span>5000+</span>
                                <p>Talented Hunter</p>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-3 col-md-4 col-sm-5">
                            <div class="footer-tittle-bottom">
                                <span>451</span>
                                <p>Talented Hunter</p>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-3 col-md-4 col-sm-5">
                            {/* <!-- Footer Bottom Tittle --> */}
                            <div class="footer-tittle-bottom">
                                <span>568</span>
                                <p>Talented Hunter</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer-bottom-area footer-bg">
                <div class="container">
                    <div class="footer-border">
                        <div class="row d-flex justify-content-between align-items-center">
                            <div class="col-xl-10 col-lg-10 ">
                                <div class="footer-copy-right">
                                    <p>
                                        Copyright &copy; {new Date().getFullYear()} All rights reserved | This template is made with <a href="https://manifestinfotech.com/" className="nav-link-style">Manifest Infotech Pvt. Ltd.</a>
                                    </p>
                                </div>
                            </div>
                            <div class="col-xl-2 col-lg-2">
                                <div id='footer' class="footer-social f-right">
                                    <a href="https://www.facebook.com/"><i class="fab fa-facebook-f"></i></a>
                                    <a href="https://twitter.com/"><i class="fab fa-twitter"></i></a>
                                    <a href="https://www.google.com/maps/place/Indore,+Madhya+Pradesh/@22.724205,75.6990332,11z/data=!3m1!4b1!4m6!3m5!1s0x3962fcad1b410ddb:0x96ec4da356240f4!8m2!3d22.7195687!4d75.8577258!16zL20vMDFfeXZ5?entry=ttu"><i class="fas fa-globe"></i></a>
                                    <a href="https://www.behance.net/"><i class="fab fa-behance"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    )

}

export default AppFooter