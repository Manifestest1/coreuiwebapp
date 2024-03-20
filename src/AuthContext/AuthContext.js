// AuthContext.js
import React, { createContext, useContext, useState } from 'react';

const AuthContext = createContext();

export const AuthProvider = ({ children }) => {
  const [userProfile, setUserProfile] = useState(null);

  return (
    <AuthContext.Provider value={{ userProfile, setUserProfile }}>
      {children}
    </AuthContext.Provider>
  );
};

export const useAuthProfile = () => useContext(AuthContext); 