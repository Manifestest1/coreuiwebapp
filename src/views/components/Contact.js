import React, { useState,useRef } from "react";
import axios from "axios";
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
  const captchaRef = useRef(null)

  const handleChange = (e) => {
    const { name, value } = e.target;
    setContactData((prevUser) => ({ ...prevUser, [name]: value }));
  };

  const handleCloseModal = () => {
    setShowModal(false);
    window.location.reload();  
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    
    if (captchaRef.current) 
    {
    const gr_token = captchaRef.current.getValue();
    // console.log(gr_token,"Google Captch");
    captchaRef.current.reset();

  
    // Proceed with form submission
   
    createContactDetail({ ...contactData, 'g-recaptcha-response': gr_token })
      .then((response) => {
        console.log("Contact form submitted:", response);
        
        if (response && response.status === 200) 
          {
          setContactData({
            message: "",
            name: "",
            email: "",
            subject: "",
          });
          console.log("Contact form submitted:", response.data);
          setShowModal(true); // Show modal on successful submission
        } else {
          console.error("Unexpected response:", response);
          // Handle unexpected response
        }
      })
      .catch((error) => {
        console.error("Contact error", error);
        // Handle API call error
      });
    } 
    else 
    {
      console.error("ReCAPTCHA token is null");
      // Handle null token error
    }
 
  };

  return(
    <>
         {/* <!-- ================ contact section start ================= --> */}


    {/* <!-- Hero Area End --> */}
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
                                <textarea class="form-control w-100" name="message" id="message" cols="30" rows="9" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Message'" placeholder=" Enter Message" onChange={handleChange}></textarea>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <input class="form-control valid" name="name" id="name" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter your name'" placeholder="Enter your name" onChange={handleChange}/>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <input class="form-control valid" name="email" id="email" type="email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter email address'" placeholder="Email" onChange={handleChange}/>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group">
                                <input class="form-control" name="subject" id="subject" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Subject'" placeholder="Enter Subject" onChange={handleChange}/>
                            </div>
                        </div>

                            <div class="col-12">
                                <div class="form-group">
                                   <ReCAPTCHA ref={captchaRef} sitekey={process.env.REACT_APP_SITE_KEY}  />
                                </div>
                            </div>
                            
                        </div>
                        <div class="form-group mt-3">
                            <button className='btn' type="submit" >Send</button>
                        </div>
                    </form>
                </div>
                <div class="col-lg-3 offset-lg-1">
                <div class="media contact-info">
                    <span class="contact-info__icon"><i class="ti-home"></i></span>
                    <div class="media-body">
                        <h3>Buttonwood, California.</h3>
                        <p>Rosemead, CA 91770</p>
                    </div>
                </div>
                <div class="media contact-info">
                    <span class="contact-info__icon"><i class="ti-tablet"></i></span>
                    <div class="media-body">
                        <h3>+1 253 565 2365</h3>
                        <p>Mon to Fri 9am to 6pm</p>
                    </div>
                </div>
                <div class="media contact-info">
                    <span class="contact-info__icon"><i class="ti-email"></i></span>
                    <div class="media-body">
                        <h3>support@colorlib.com</h3>
                        <p>Send us your query anytime!</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

      {/* Bootstrap Modal */}
      <div className={`modal ${showModal ? 'show' : ''}`} style={{ display: showModal ? 'block' : 'none' }}>
        <div className="modal-dialog">
          <div className="modal-content">
            <div className="modal-header">
              <h5 className="modal-title">Success</h5>
              <button type="button" className="btn-close" onClick={handleCloseModal}></button>
            </div>
            <div className="modal-body">
              <p>Your data is saved successfully.</p>
            </div>
            <div className="modal-footer">
              <button type="button" className="btn btn-secondary" onClick={handleCloseModal}>Close</button>
            </div>
          </div>
        </div>
      </div>
    </>
  );
};

export default Contact;
