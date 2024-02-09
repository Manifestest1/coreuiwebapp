import React,{ useEffect, useState } from 'react'
import useAuth from '../../../useAuth';
import {
  CButton,
  CCard,
  CCardBody,
  CCol,
  CContainer, 
  CCardHeader,
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
  CAvatar,
  CCardTitle
} from '@coreui/react'
import CIcon from '@coreui/icons-react'
import {cilTextSize,cilDescription,cilLocationPin} from '@coreui/icons' 
import { useNavigate, useParams } from 'react-router-dom'
import {getJobViewEmployer,jobApplyEmployee} from '../../../apiService';

const JobViewEmployerUserprofile = () => { 
  const { isAuthenticated } = useAuth();
  const { jobId } = useParams();
  const navigate = useNavigate()
  const [job, setJob] = useState({name: '',phone: null,imageurl: null});
  const [jobPostUsers, setjobPostUsers] = useState();
  const [countjobPostUsers, setCountjobPostUsers] = useState();

  const handleBtnPublicProfileOpen = (userId) => {
    navigate(`/public-profile-employee/${userId}`);
   };

  useEffect(() => {
    getJobViewEmployer(jobId)
    .then((r) => {
        console.log(r.data,"job view Users");
      setJob(r.data.job);
      setjobPostUsers(r.data.jobpostusers);
      setCountjobPostUsers(r.data.count)
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
                <CCardTitle className="fw-bold">Job View</CCardTitle>
            </CCardHeader>
            <CCardBody>
              <CForm>
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
                      {/* <CButton type="submit" color="primary" className="px-4">Apply</CButton> */}
                    </CCol>
              </CRow>
              </CForm>
             {countjobPostUsers > 0 ? (<p className="fw-bold" style={{ color: 'rebeccapurple',background:'#ededed',padding:'7px', fontSize: '20px' }}>
              Job Post Users <span>{countjobPostUsers}</span> </p>): ('')}
    
              {jobPostUsers && jobPostUsers.length > 0 ? (<CTable striped>
            <CTableHead className='text-center'>
              <CTableRow>
                <CTableHeaderCell scope="col">Profile</CTableHeaderCell>
                <CTableHeaderCell scope="col">Name</CTableHeaderCell>
                <CTableHeaderCell scope="col">Action</CTableHeaderCell>
                {/* Add more header cells as needed */}
              </CTableRow>
            </CTableHead> 
            <CTableBody className='text-center'>
                {jobPostUsers?.map((user, index) => (
                  <CTableRow key={index}>
                    <CTableDataCell><CAvatar src={user.imageurl} size="md" /></CTableDataCell>
                    <CTableDataCell>{user.name}</CTableDataCell>
                    <CTableDataCell><CButton type="submit" onClick={() => handleBtnPublicProfileOpen(user.id)} color="primary" className="px-4">Profile Show</CButton></CTableDataCell>
                  </CTableRow>
                ))}
                
            </CTableBody>
        </CTable>)  : (
  <p className="text-center fw-bold" style={{color:'rebeccapurple',fontSize:'20px'}}>No Job Post Users Available.</p>
)}

            </CCardBody>
          </CCard>
        </CCol>
      </CRow>
    </CContainer>
    </div>
    
    </>
  )
}

export default JobViewEmployerUserprofile
