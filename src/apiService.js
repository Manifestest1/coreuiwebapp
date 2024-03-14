import api from './api'; 

  export const getClientId = () => {
    return "620552090072-ucb04bnq9lt3i3rsdhtnrfvkv9pne2c4.apps.googleusercontent.com";
  };
  
  export const getUserProfile = () => { 
    return api.get('/user-profile');
  };
 
  export const createUserProfile = async (selectedRole) => {
    return await api.post('/create-profile', { role: selectedRole });
  };

  export const updateUserProfile = (user) => {
    return api.post('/update-profile', user );
  };

  export const createJobPost = (job) => {
    return api.post('/create-jobpost', job );
  };

  export const getJobonEmployee = () => {
    return api.get('/job-get-employee');
  };

  export const searchJobGet = (jobsearch) => {
    return api.post('/job-search-employer', jobsearch);
  };

  export const getJobView = (jobId) => {
    return api.get(`/job-view/${jobId}`);
  };

  export const jobApplyEmployee = (jobId) => {
    return api.get(`/job-apply/${jobId}`);
  };

  
  export const getJobonEmployer = () => {
    return api.get('/job-get-employer');
  };

  export const getJobViewEmployer = (jobId) => {
    return api.get(`/job-view-employer/${jobId}`);
  };

  export const getPublicEmployeeProfile = (userId) => {
    return api.get(`/public-profile-employee/${userId}`);
  };

  export const logoutUserProfile = () => {
    return api.post('/logout', {}, {});
  };