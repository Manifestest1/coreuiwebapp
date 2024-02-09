import React,{ useEffect, useState } from 'react'
import useAuth from '../../../useAuth';
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
  CFormTextarea,
  CTooltip,
  CFormFeedback
} from '@coreui/react'
import { CChartLine } from '@coreui/react-chartjs'
import { getStyle, hexToRgba } from '@coreui/utils'
import  CIcon from '@coreui/icons-react'
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
  cilArrowThickToLeft,
  cilTextSize,
  cilDescription,
  cilLocationPin,
} from '@coreui/icons' 
import {createJobPost} from '../../../apiService';


const JobContainer = () => {
  const { isAuthenticated } = useAuth();
  const [user, setUser] = useState({title: '',description: '',location: ''});
  const [isValid, setIsValid] = useState(true);

const handleChange = (e) => {
    const { name, value, type } = e.target;
    setIsValid(e.target.value.length > 0); 
    if (type === 'file') 
    {
        setSelectedImage(e.target.files[0]);
    } 
    else 
    {
        setUser((prevUser) => ({ ...prevUser, [name]: value }));
    }
   
  };
  const handleJobSubmit = (e) => {
    e.preventDefault();

    const formData = new FormData();

    // Append Job data
    formData.append('title', user.title);
    formData.append('description', user.description);
    formData.append('location', user.location);
    createJobPost(formData)
    .then((response) => {
      alert('Job Post Succesfully.');
      console.warn('Job Post result', response);
    })
    .catch((error) => {
      console.error('Job Post error', error);
    });
  };

  return (
    <div className="c-app c-default-layout flex-row align-items-center">
    <CContainer>
      <CRow className="justify-content-center">
        <CCol md="12" lg="12" xl="12">
          <CCard className="mx-4">
            <CCardHeader className="text-center">
              <h1>Job Post</h1>
            </CCardHeader>
            <CCardBody>
              <CForm onSubmit={handleJobSubmit}>
                  <CInputGroup className="mb-3">
                    <CInputGroupText>
                      <CIcon icon={cilTextSize} />
                    </CInputGroupText>
                    <CFormInput onChange={handleChange} invalid={!isValid} name="title" type="text"/>
                  </CInputGroup>
                  <CInputGroup className="mb-3">
                    <CInputGroupText>
                      <CIcon icon={cilDescription} />
                    </CInputGroupText>
                    <CFormTextarea onChange={handleChange} invalid={!isValid} name="description" type="text"/>
                  </CInputGroup>
                  <CInputGroup className="mb-3">
                    <CInputGroupText>
                      <CIcon icon={cilLocationPin} />
                    </CInputGroupText>
                    <CFormInput onChange={handleChange} invalid={!isValid} name="location" type="text"/>
                  </CInputGroup>
              <CRow>
                  <CFormFeedback invalid={!isValid}>Please enter a valid value.</CFormFeedback>
                    <CCol xs={10}></CCol>
                    <CCol xs={2} className="text-right">
                      <CButton type="submit" color="primary" className="px-4">Post Job</CButton>
                    </CCol>
              </CRow>
              </CForm>
            </CCardBody>
          </CCard>
        </CCol>
      </CRow>
    </CContainer>
  </div>
  );
};

export default JobContainer;
