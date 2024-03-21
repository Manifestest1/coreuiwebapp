
import { gapi } from 'gapi-script';
import {logoutUserProfile} from '../../apiService';
import axiosInstance from '../../api';

export const loginFun = (setUser) => {

    gapi.auth2.getAuthInstance().signIn({
        scope: 'openid profile email',
        prompt: 'select_account', // Forces account chooser
      }).then((googleUser) => {
        // Handle successful login
        const payload = { email: googleUser.wt.cu, name: googleUser.wt.Ad, google_id: googleUser.wt.NT,imageurl: googleUser.wt.hK,password: "12345678"}
     
        let headers = { 'Content-Type': 'application/json' }
        axiosInstance.post('/login',payload,headers).then((r) => { 
          console.log(r.data,"Api Response In Login Side")
            if(r.data.authorisation.token)
            {
              setUser(r.data.user);
              localStorage.setItem('_token', r.data.authorisation.token)
              // navigate('/job_listing')
            }
          })
        
      }).catch((error) => {
        // Handle login error
        console.error('Error signing in with Google:', error);
      });
  };
  
  export const logoutFun = () => {

    try 
    {
        const authInstance = gapi.auth2.getAuthInstance();
        authInstance.signOut();
        localStorage.removeItem('_token');
        localStorage.removeItem('user');
        localStorage.removeItem('loggedIn');
        // Clear authentication-related information
        logoutUserProfile()
          .then((r) => {
            localStorage.removeItem('_token');
           })
          .catch((e) => {
            console.error(e);
          });
  
    } 
    catch (error) 
    {
      console.error('Error during logout:', error); 
    }
  };