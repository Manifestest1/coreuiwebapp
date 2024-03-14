import React,{ useEffect, useState } from 'react'
import useAuth from '../../useAuth';
import {
  CCard,
  CCardBody,
  CCol,
  CContainer, 
  CCardHeader,
  CRow,
  CCardTitle
} from '@coreui/react'
import { useNavigate,useParams } from 'react-router-dom'
import {getPublicEmployeeProfile} from '../../apiService';



const Userprofile = () => { 
  const navigate = useNavigate()
  const { isAuthenticated } = useAuth();
  const { userId } = useParams();
  const [user, setUser] = useState({})

  useEffect(() => {
    getPublicEmployeeProfile(userId)
    .then((r) => {
      setUser(r.data);
    })
    .catch((e) => {
        console.log(e)
    });
  }, []); // Empty dependency array to ensure the effect runs only once
  

  return (
    <>
      <div className="c-app c-default-layout flex-row align-items-center">
      <CContainer>
        <CRow className="justify-content-center">
          <CCol md="12" lg="12" xl="12">
            <CCard className="mx-4">
              <CCardHeader className="text-center">
                <CCardTitle className="fw-bold">Employee Profile</CCardTitle>
              </CCardHeader>
              <CCardBody>
                <CRow>
                  <CCol xs={8}>
                    <img className="text-center" src={user.imageurl}  style={{ borderRadius: 96,height:'100%'}}/>
                  </CCol>
                  <CCol xs={8}>
                    <h5  style={{ marginTop: 20 }}>Name: {user.name}</h5>
                    <h5 style={{ marginTop: 20 }}>Email: {user.email}</h5>
                    <h5 style={{ marginTop: 20 }}>Role: Employee</h5>
                    <h5 style={{ marginTop: 20 }}>Phone: {user.phone}</h5>
                  </CCol>
                </CRow>
              </CCardBody>
             
            </CCard>
          </CCol>
        </CRow>
      </CContainer>
    </div>
    
    </>
  )
}

export default Userprofile
