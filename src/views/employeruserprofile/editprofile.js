import React,{ useEffect, useState } from 'react'
import useAuth from '../../useAuth';
import {
  CAvatar,
  CButton,
  CButtonGroup,
  CCard,
  CCardBody,
  CCardGroup,
  CCol,
  CContainer, 
  CCardFooter,
  CCardHeader,
  CProgress,
  CRow,
  CFormInput,
  CInputGroup,
  CForm,
  CInputGroupText,
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
  cilPhone,
  cilImage,
} from '@coreui/icons' 
import axios from 'axios'
import { Link, useNavigate } from 'react-router-dom'
import {getUserProfile,updateUserProfile} from '../../apiService';



const Userprofile = () => { 
  const { isAuthenticated } = useAuth();
  const navigate = useNavigate()
  const [user, setUser] = useState({name: '',phone: null,imageurl: null});
  const [selectedImage, setSelectedImage] = useState(null);

  const handleChange = (e) => {
    const { name, value, type } = e.target;
    if (type === 'file') 
    {
        setSelectedImage(e.target.files[0]);
    } 
    else 
    {
        setUser((prevUser) => ({ ...prevUser, [name]: value }));
    }
   
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    const formData = new FormData();

    // Append user data
    formData.append('name', user.name);
    formData.append('phone', user.phone);

    // Append the selected image file
    if (selectedImage) {
      formData.append('imageurl', selectedImage, selectedImage.name);
    }
    updateUserProfile(formData)
          .then((response) => {
            navigate('/employer-profile');
            console.warn('Edit result', response);
          })
          .catch((error) => {
            console.error('Edit error', error);
          });
    console.log(user, "update");
   };

  useEffect(() => {
    getUserProfile()
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
                <h1>Employer Profile</h1>
              </CCardHeader>
              <CCardBody>
                {/* Your profile content goes here */}
                <CForm onSubmit={handleSubmit}>
                    <CInputGroup className="mb-3">
                      <CInputGroupText>
                        <CIcon icon={cilUser} />
                      </CInputGroupText>
                      <CFormInput value={user.name} onChange={handleChange} name="name" type="text"/>
                    </CInputGroup>
                    <CInputGroup className="mb-3">
                      <CInputGroupText>
                        <CIcon icon={cilPhone} />
                      </CInputGroupText>
                      <CFormInput value={user.phone} onChange={handleChange} name="phone" type="number"/>
                    </CInputGroup>
                    <CInputGroup className="mb-3">
                      <CInputGroupText>
                        <CIcon icon={cilImage} />
                      </CInputGroupText>
                      <CFormInput onChange={handleChange} name="imageurl" type="file"/>
                    </CInputGroup>
                    <CRow>
                          <CCol xs={10}></CCol>
                          <CCol xs={2} className="text-right">
                            <CButton type="submit" color="primary" className="px-4">Update</CButton>
                          </CCol>
                    </CRow>
                </CForm>
               
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
