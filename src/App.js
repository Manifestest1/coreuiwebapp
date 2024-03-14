import logo from './logo.svg';
import './App.css';
import { useEffect,useState } from 'react';
import AppHeader from './views/layout/AppHeader';
import AppFooter from './views/layout/AppFooter';
import Home from './views/components/Home';

function App() 
{
 
  return (
  <>
     <AppHeader/>
       <Home/>
      <AppFooter/>
  </>
  );
}

export default App;
