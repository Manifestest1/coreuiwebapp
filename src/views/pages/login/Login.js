import React, { useEffect, useState } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import {CButton,CCard,CCardBody,CCardGroup,CCol,CContainer,CForm,CFormInput,CInputGroup,CInputGroupText,CRow } from '@coreui/react'
import CIcon from '@coreui/icons-react'
import { cilLockLocked, cilUser,cibGoogle } from '@coreui/icons' 
// import axios from 'axios'
import axios from 'axios'
import { GoogleLogin } from 'react-google-login' 
import { gapi } from 'gapi-script'

const Login = () => {
  const [email, setEmail] = useState('')
  const navigate = useNavigate()
  const [password, setPassword] = useState('')

  const handleLogin = () => {
  
      let headers = { 'Content-Type': 'application/json' }
      
      //console.log (email,password,"user Login");
      axios.post('http://localhost:8000/api/auth/login',{ email, password, headers }).then((r) => { 
       console.log(r.data,"Api Response")
          if(r.data.authorisation.token)
          {
            localStorage.setItem('_token', r.data.authorisation.token)
            
              if(r.data.user.role_id)
              {
                if(r.data.user.role_id == 1)
                {
                  navigate('/employee-dashboard')
                }
                else
                {
                  navigate('/employer-dashboard')
                }
              }
              else
              {
                navigate('/create-profile')
              }
            }
          })
      };
    const onFailure = (response) => {
        console.log('Login Failed Current User',response);
    };
  

 

  return (
    <div className="bg-light min-vh-100 d-flex flex-row align-items-center">
      <CContainer>
        <CRow className="justify-content-center">
          <CCol md={8}>
            <CCardGroup>
              <CCard className="p-4">
                <CCardBody>
                  <CForm>
                    <h1>Login</h1>
                    <p className="text-medium-emphasis">Sign In to your account</p>
                    <CInputGroup className="mb-3">
                      <CInputGroupText>
                        <CIcon icon={cilUser} />
                      </CInputGroupText>
                      <CFormInput value={email} onChange={(e) => setEmail(e.target.value)} />
                    </CInputGroup>
                    <CInputGroup className="mb-4">
                      <CInputGroupText>
                        <CIcon icon={cilLockLocked} />
                      </CInputGroupText>
                      <CFormInput value={password} onChange={(e) => setPassword(e.target.value)} />
                    </CInputGroup>
                    <CRow>
                      <CCol xs={6}>
                        <CButton onClick={handleLogin} color="info" className="px-4">
                          Login
                        </CButton>
                      </CCol>
                    </CRow>
                  </CForm>
                </CCardBody>
              </CCard>
            </CCardGroup>
          </CCol>
        </CRow>
      </CContainer>
    </div>
  )
}

export default Login
