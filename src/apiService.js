
import instance from './axios';

export const getClientId = () => {
  return "487377604551-gort01f6fqu0ujrdfvqoif6sa0gio1lq.apps.googleusercontent.com";
};

export const UserLoginApi = (user) => {
  return instance.post('/login', user);
};
  
  export const getUserProfile = () => { 
    return instance.get('/user-profile');
  };
 
  export const createUserProfile = async (roleId) => {
    return await instance.post('/create-profile', { role: roleId });
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

  // export const employeeDownloadPdf = (userId) => {
  //   return instance.get(`/employee-download-pdf/${userId}`);
  // };

  export const getEmployee = () => {
    return instance.get('/get-employee');
  };

  export const searchJobGet = (jobsearch) => {
    return instance.post('/job-search-employer', jobsearch);
  };

  export const getJobViewEmployee = (jobId) => {
    return instance.get(`/job-view/${jobId}`);
  };

  export const getFavJob = (jobId) => {
    return instance.get(`/fav-job-user/${jobId}`);
  };

  export const jobApplyEmployee = (jobId) => {
    return instance.get(`/job-apply/${jobId}`);
  };

  export const favrouiteJOb = (jobId) => {
    return instance.get(`/fav-job-employee/${jobId}`);
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

  export const employeePdfDownload = (userId) => {
    return instance.get(`/employee-download-pdf/${userId}`);
};

  export const createContactDetail = (data) => {
    return instance.post('/contact-mail-send', data );
  };
  
  export const employeeFavJob = () => { 
    return instance.get('/employee-fav-job');
  };

  export const logoutUserProfile = () => {
    return instance.post('/logout');
  };