import React, { useState,useRef } from "react";
import ReCAPTCHA from "react-google-recaptcha";
import { createContactDetail } from "../../apiService";

const Contact = () => {
  const [contactData, setContactData] = useState({
    message: "",
    name: "",
    email: "",
    subject: "",
  });
  const [recaptchaToken, setRecaptchaToken] = useState("");
  const [showModal, setShowModal] = useState(false);
  const [errors, setErrors] = useState({
    message: "",
    name: "",
    email: "",
    subject: "",
  });
  const captchaRef = useRef(null)

  const handleChange = (e) => {
    const { name, value } = e.target;
    setContactData((prevUser) => ({ ...prevUser, [name]: value }));
    setErrors((prevErrors) => ({ ...prevErrors, [name]: "" }));
  };

  const handleCloseModal = () => {
    setShowModal(false);
    window.location.reload();  
  };

  const handleSubmit = (e) => {
    e.preventDefault();
  
    const newErrors = {};
  
    if (!contactData.name.trim()) {
      newErrors.name = "Name is required";
    }
  
    if (!contactData.email.trim() || !contactData.email.includes("@")) {
      newErrors.email =
        "Email is required and must be a valid email address";
    }
  
    if (contactData.message.trim().split(/\s+/).length <= 10) {
      newErrors.message = "Message must be less than or equal to 10 words long";
    }
  
    if (contactData.subject.trim().split(/\s+/).length <= 10) {
      newErrors.subject = "Subject must be less than or equal to 10 words long";
    }
  
    if (Object.keys(newErrors).length > 0) {
      setErrors(newErrors);
      return;
    }
  
    if (captchaRef.current) {
      const gr_token = captchaRef.current.getValue();
      captchaRef.current.reset();
  
      createContactDetail({
        ...contactData,
        'g-recaptcha-response': gr_token,
      })
        .then((response) => {
          console.log("Contact form submitted:", response);
  
          if (response && response.status === 200) {
            setContactData({
              message: "",
              name: "",
              email: "",
              subject: "",
            });
            console.log("Contact form submitted:", response.data);
            setShowModal(true);
          } else {
            console.error("Unexpected response:", response);
            // Handle unexpected response
          }
        })
        .catch((error) => {
          console.error("Contact error", error);
        });
    } else {
      setErrors({
        ...newErrors,
      });
      console.error("ReCAPTCHA token is null");
    }
  }; 

  return(
    <>
      <div class="slider-area ">
          <div class="single-slider section-overly slider-height2 d-flex align-items-center single-slider-contact">
              <div class="container">
                  <div class="row">
                      <div class="col-xl-12">
                          <div class="hero-cap text-center">
                              <h2>Contact Us</h2>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
      </div>
      <div class="container">
        <div class="d-none d-sm-block mb-5 pb-4">
            <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDpfS1oRGreGSBU5HHjMmQ3o5NLw7VdJ6I&amp;callback=initMap">
            </script>
        </div>
        <div class="row">
          <div class="col-12">
              <h2 class="contact-title">Get in Touch</h2> 
          </div>
          <div class="col-lg-8">
            <form class="form-contact contact_form" novalidate="novalidate" onSubmit={handleSubmit}>
              <div class="row">
                <div class="col-12">
                  <div class="form-group">
                    <textarea  
                        className={`form-control ${errors.message ? "is-invalid" : "custom-class"}`} 
                        name="message" 
                        id="message"  
                        onFocus={(e) => e.target.placeholder = ''} 
                        onBlur={(e) => e.target.placeholder = 'Enter Message'} 
                        placeholder=" Enter Message" 
                        onChange={handleChange}
                    ></textarea>
                    {errors.message && <div className="invalid-feedback" >{errors.message}</div>}
                  </div>
                </div>
                <div class="col-sm-6">
                  <div class="form-group">
                    <input 
                      className={`form-control ${errors.name ? "is-invalid" : ""}`}  
                      name="name" 
                      id="name" 
                      type="text" 
                      onfocus="this.placeholder = ''" 
                      onblur="this.placeholder = 'Enter your name'" 
                      placeholder="Enter your name" 
                      onChange={handleChange}
                    />
                    {errors.name && <div className="invalid-feedback" >{errors.name}</div>}
                  </div>
                </div>
                <div class="col-sm-6">
                  <div class="form-group">
                    <input 
                      className={`form-control ${errors.email ? "is-invalid" : ""}`} 
                      name="email" 
                      id="email" 
                      type="email" 
                      onfocus="this.placeholder = ''" 
                      onblur="this.placeholder = 'Enter email address'" 
                      placeholder="Email" 
                      onChange={handleChange}
                    />
                    {errors.email && <div className="invalid-feedback" >{errors.email}</div>}
                  </div>
                </div>
                <div class="col-12">
                  <div class="form-group">
                    <input 
                      className={`form-control ${errors.subject ? "is-invalid" : ""}`} 
                      name="subject" 
                      id="subject" 
                      type="text" 
                      onfocus="this.placeholder = ''" 
                      onblur="this.placeholder = 'Enter Subject'" 
                      placeholder="Enter Subject" 
                      onChange={handleChange}
                    />
                    {errors.subject && <div className="invalid-feedback" >{errors.subject}</div>}
                  </div>
                  </div>
                <div className="col-12" >
                  <div className="form-group">
                    <ReCAPTCHA  className="form-control "
                    ref={captchaRef} 
                    id="captcha"
                    sitekey={process.env.REACT_APP_SITE_KEY} />
                  </div>
                </div>  
              </div>
              <div class="form-group mt-3">
                <button className="genric-btn success-border radius" id="con" type="submit" >Send</button>
              </div>
            </form>
          </div>
          <div class="col-lg-3 offset-lg-1">
            <div class="media contact-info">
              <span class="contact-info__icon"><i class="ti-home"></i></span>
                <div class="media-body">
                    <p>319 B Tulsi Nagar, Indore (MP)</p>
                </div>
              </div>
            <div class="media contact-info">
              <span class="contact-info__icon"><i class="ti-tablet"></i></span>
              <div class="media-body">
                  <h3> 91 91114 44776</h3>
                  <p>Mon to Fri 9am to 7pm</p>
              </div>
            </div>
            <div class="media contact-info">
              <span class="contact-info__icon"><i class="ti-email"></i></span>
              <div class="media-body">
                  <h3>info@manifestinfotech.com</h3>
                  <p>Send us your query anytime!</p>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div className={`modal ${showModal ? 'show' : ''}`} style={{ display: showModal ? 'block' : 'none' }}>
        <div className="modal-dialog">
          <div className="modal-content">
            <div className="modal-header">
              <h5 className="modal-title">Success</h5>
              <button type="button" className="btn-close" onClick={handleCloseModal}></button>
            </div>
            <div className="modal-body">
              <p>Thank you for your correspondence</p>
            </div>
            <div className="modal-footer">
              <button  className="genric-btn success-border radius" onClick={handleCloseModal}>Close</button>
            </div>
          </div>
        </div>
      </div>
    </>
  )
};

export default Contact;
