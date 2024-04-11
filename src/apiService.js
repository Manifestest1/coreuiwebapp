
import instance from './axios';

  export const getClientId = () => {
    return "620552090072-ucb04bnq9lt3i3rsdhtnrfvkv9pne2c4.apps.googleusercontent.com";
  };

  export const UserLoginApi = (user) => {
    return instance.post('/login', user );
  };
  
  export const getUserProfile = () => { 
    return instance.get('/user-profile');
  };
 
  export const createUserProfile = async (selectedRole) => {
    return await instance.post('/create-profile', { role: selectedRole }); 
  };

  export const updateUserProfile = (user) => {
    return instance.post('/update-profile', user );
  };

  export const updateEmployeeProfile = (user) => {
    return instance.post('/update-employee-profile', user );
  };

  export const updateEmployerProfile = (user) => {
    return instance.post('/update-employer-profile', user );
  };

  export const createJobPost = (job) => {
    return instance.post('/create-jobpost', job );
  };

  export const getJobonEmployee = () => {
    return instance.get('/job-get-employee');
  };

  export const searchJobGet = (jobsearch) => {
    return instance.post('/job-search-employer', jobsearch);
  };

  export const getJobViewEmployee = (jobId) => {
    return instance.get(`/job-view/${jobId}`);
  };

  export const jobApplyEmployee = (jobId) => {
    return instance.get(`/job-apply/${jobId}`);
  };

  
  export const getJobonEmployer = () => { 
    return instance.get('/job-get-employer');
  };

  export const getJobViewEmployer = (jobId) => {
    return instance.get(`/job-view-employer/${jobId}`); 
  };

  export const getPublicEmployeeProfile = (userId) => {
    return instance.get(`/public-profile-employee/${userId}`);
  };

  export const logoutUserProfile = () => {
    return instance.post('/logout');
  };