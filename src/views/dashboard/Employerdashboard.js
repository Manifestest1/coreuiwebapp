import React,{ useEffect, useState } from 'react'
import useAuth from '../../useAuth';
import {
  CAvatar,
  CButton,
  CButtonGroup,
  CCard,
  CCardBody,
  CCardFooter,
  CCardHeader,
  CCol,
  CProgress,
  CRow,
  CTable,
  CTableBody,
  CTableDataCell,
  CTableHead,
  CTableHeaderCell,
  CTableRow,
} from '@coreui/react'
import { CChartLine } from '@coreui/react-chartjs'
import { getStyle, hexToRgba } from '@coreui/utils'  
import CIcon from '@coreui/icons-react'
import {
  cibCcAmex,
  cibCcApplePay,
  cibCcMastercard,
  cibCcPaypal,
  cibCcStripe,
  cibCcVisa,
  cibGoogle,
  cibFacebook,
  cibLinkedin,
  cifBr,
  cifEs,
  cifFr,
  cifIn,
  cifPl,
  cifUs,
  cibTwitter,
  cilCloudDownload,
  cilPeople,
  cilUser,
  cilUserFemale,
} from '@coreui/icons' 
import axios from 'axios'
import { Link, useNavigate } from 'react-router-dom'
import LoadingSpinner from 'src/LoadingSpinner';



const Employerdashboard = () => { 
  const { isAuthenticated } = useAuth();
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    // Simulate a delay and set loading to false
    const timeout = setTimeout(() => {
      setLoading(false);
    }, 2000);

    return () => clearTimeout(timeout); // Clear the timeout on component unmount
  }, []);
  return (
    <>
       <div>
      {loading ? (
        <LoadingSpinner /> 
      ) : (
        // Your component content when not loading
        <div>Employer Dashboard</div>
      )}
    </div>
    
    </>
  )
}

export default Employerdashboard
