import React, { useEffect, useState } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import {
  CButton,
  CCard,
  CCardBody,
  CCardGroup,
  CCol,
  CContainer, 
  CForm,
  CFormInput,
  CInputGroup,
  CInputGroupText,
  CRow,
} from '@coreui/react'
import CIcon from '@coreui/icons-react'
import { cilLockLocked, cilUser } from '@coreui/icons' 
import axios from 'axios'
import { GoogleLogin } from 'react-google-login'
import { gapi } from 'gapi-script'

const client_id = '620552090072-ucb04bnq9lt3i3rsdhtnrfvkv9pne2c4.apps.googleusercontent.com'

const Login = () => {
  const [email, setEmail] = useState('')
  const navigate = useNavigate()
  const [password, setPassword] = useState('')

  useEffect(() => {
    function start() {
      gapi.client.init({
        clientId: client_id,
        scope: "",
      }).then(() => {
        console.log('Google API client initialized')
      }).catch((error) => {
        console.error('Error initializing Google API client:', error)
      })
    }
    gapi.load('client', start)
  }, []) // Empty dependency array to ensure the effect runs only once

  const onSuccess = (response) => {
    let payload = { email: response.profileObj.email, name: response.profileObj.name, google_id: response.profileObj.googleId,imageurl: response.profileObj.imageUrl,password: "12345678"}
    let headers = { 'Content-Type': 'application/json' }
    axios.post('/login',payload,headers).then((r) => {
        if(r.data.authorisation.token)
        {
            localStorage.setItem('_token', r.data.authorisation.token)
            console.log(r.data,"in Login");
            navigate('/create-profile')
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
                        <CButton color="primary" className="px-4">
                          Login
                        </CButton>
                      </CCol>
                      <CCol xs={6} className="text-right">
                        <CButton color="link" className="px-0">
                          Forgot password?
                        </CButton>
                      </CCol>
                    </CRow>
                    <CRow className="mt-4">
                      <CCol xs={12}>
                      <GoogleLogin
                        clientId={client_id}
                        buttonText="Login with Google"
                        onSuccess={onSuccess}
                        onFailure={onFailure}
                        cookiePolicy={'single_host_origin'}
                        isSignedIn={true}
                        />
                      </CCol>
                    </CRow>
                  </CForm>
                </CCardBody>
              </CCard>
              <CCard className="text-white bg-primary py-5" style={{ width: '44%' }}>
                <CCardBody className="text-center">
                  <div>
                    <h2>Sign up</h2>
                    <p>
                      Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                      tempor incididunt ut labore et dolore magna aliqua.
                    </p>
                    <Link to="/register">
                      <CButton color="primary" className="mt-3" active tabIndex={-1}>
                        Register Now!
                      </CButton>
                    </Link>
                  </div>
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
