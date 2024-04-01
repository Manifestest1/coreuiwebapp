import { gapi } from 'gapi-script';
import {UserLoginApi,logoutUserProfile} from '../../apiService'

export const loginFun = (setUser,navigate,setToken) => {   
 
    gapi.auth2.getAuthInstance().signIn({
        scope: 'openid profile email',
        prompt: 'select_account', // Forces account chooser
      }).then((googleUser) => {
        // Handle successful login
        const payload = { email: googleUser.wt.cu, name: googleUser.wt.Ad, google_id: googleUser.wt.NT,imageurl: googleUser.wt.hK,password: "12345678"}
        UserLoginApi(payload)
        .then((r) => { 
          console.log(r.data.authorisation.token,"Api Response In Login Side")
            if(r.data.authorisation.token)
            {
              setUser(r.data.user); 
              setToken(r.data.authorisation.token);

              if (r.data.user) 
              {
                  if (r.data.user.role_id === 1) 
                  {
                    console.log('Employee')
                    navigate('/employee-dashboard');
                  } 
                  else if(r.data.user.role_id === 2) 
                  {
                    console.log('Employer')
                    navigate('/employer-dashboard');
                  }
                  else
                  {
                    navigate('/create-profile');
                    console.log('Create Profile')
                  }
             }
             else
             {
              navigate('/');
             }
            }
          })
        
      }).catch((error) => {
        // Handle login error
        console.error('Error signing in with Google:', error);
      });
  };

  export const logoutFun = (navigate) => {
    try {
      // Send a request to the logout endpoint with the authentication token
      logoutUserProfile()
      .then((response) => {
        console.log("logout User Succesfully Test");
        // Clear local storage and navigate to the homepage
        localStorage.removeItem('_token');
        localStorage.removeItem('user');
        localStorage.removeItem('loggedIn');
        navigate('/');
      })
      .catch((error) => {
        console.error('Error during logout:', error);
        // Handle error, e.g., display a message to the user
      });
    } 
    catch (error) 
    {
      console.error('Error during logout:', error);
    }
  };