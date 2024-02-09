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
  CFormFeedback,
  CCardTitle
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
  cilTextSize,
  cilDescription,
  cilLocationPin,
} from '@coreui/icons' 
import { Link, useNavigate, useParams } from 'react-router-dom'
import {getJobView,jobApplyEmployee} from '../../../apiService';

const JobViewEmployeeUserprofile = () => { 
  const { isAuthenticated } = useAuth();
  const { jobId } = useParams();
  const navigate = useNavigate()
  const [job, setJob] = useState({name: '',phone: null,imageurl: null});

  const handleJobApply = (e) => {
    e.preventDefault();
    jobApplyEmployee(jobId)
          .then((response) => {
            navigate('/job-get-employee');
            console.warn('Edit result', response);
          })
          .catch((error) => {
            console.error('Edit error', error);
          });
   
   };

  useEffect(() => {
    getJobView(jobId)
    .then((r) => {
      setJob(r.data);
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
              <CCardTitle className="fw-bold">Job Apply</CCardTitle>
            </CCardHeader>
            <CCardBody>
              <CForm onSubmit={handleJobApply}>
                  <CInputGroup className="mb-3">
                    <CInputGroupText>
                      <CIcon icon={cilTextSize} />
                    </CInputGroupText>
                    <CFormInput value={job.title} name="title" type="text"/>
                  </CInputGroup>
                  <CInputGroup className="mb-3">
                    <CInputGroupText>
                      <CIcon icon={cilDescription} />
                    </CInputGroupText>
                    <CFormTextarea value={job.description} name="description" type="text"/>
                  </CInputGroup>
                  <CInputGroup className="mb-3">
                    <CInputGroupText>
                      <CIcon icon={cilLocationPin} />
                    </CInputGroupText>
                    <CFormInput value={job.location} name="location" type="text"/>
                  </CInputGroup>
              <CRow>
                    <CCol xs={10}></CCol>
                    <CCol xs={2} className="text-right">
                      <CButton type="submit" color="primary" className="px-4">Apply</CButton>
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

export default JobViewEmployeeUserprofile
