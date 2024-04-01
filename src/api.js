import axios from 'axios';

const instance = axios.create({
  baseURL: process.env.REACT_APP_API_URL, // Set your API base URL here
  headers: {
    Authorization: `Bearer ${localStorage.getItem('_token')}`,
  },
});

export default instance;