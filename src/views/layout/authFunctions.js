import { gapi } from 'gapi-script';
import { UserLoginApi, logoutUserProfile } from '../../apiService';


export const loginFun = (setUser, navigate, setToken, setLoggedIn) => {
  gapi.auth2.getAuthInstance().signIn({
    scope: 'openid profile email',
    prompt: 'select_account',
  }).then((googleUser) => {
    const payload = {
      email: googleUser.wt.cu,
      name: googleUser.wt.Ad,
      google_id: googleUser.wt.NT,
      password: "12345678"
    };
    UserLoginApi(payload)
      .then((r) => {
        console.log(r.data, "Api Response In Login Side");
        if (r.data.authorisation.token) {
          setUser(r.data.user);
          setToken(r.data.authorisation.token);
          setLoggedIn(true);
          if (r.data.user) {
            if (r.data.user.role_id === 1) {
              console.log('Employee');
              navigate('/employee-dashboard');
            } else if (r.data.user.role_id === 2) {
              console.log('Employer');
              navigate('/employer-dashboard');
            } else {
              navigate('/create-profile');
              console.log('Create Profile');
            }
          } else {
            navigate('/create-profile');
          }
        }
      })
      .catch((error) => {
        console.error('Error during login:', error);
      });
  }).catch((error) => {
    console.error('Error signing in with Google:', error);
  });
};

export const logoutFun = (navigate) => {
  logoutUserProfile()
    .then((response) => {
      console.log("Logout User Successfully");
      localStorage.removeItem('_token');
      localStorage.removeItem('user');
      localStorage.removeItem('loggedIn');
      navigate('/');
    })
    .catch((error) => {
      console.error('Error during logout:', error);
    });
};
