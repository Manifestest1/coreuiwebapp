import { useEffect } from 'react';
import { useNavigate } from 'react-router-dom';

const useAuth = () => {
  const navigate = useNavigate();

  useEffect(() => {
    const token = localStorage.getItem('_token');

    if (!token || token === '') 
    {
      navigate('/');
    }
  }, [navigate]);

  return {
    isAuthenticated: !!localStorage.getItem('_token'),
  };
};

export default useAuth;