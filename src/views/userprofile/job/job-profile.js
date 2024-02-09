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
  CTable,
  CTableBody,
  CTableDataCell,
  CRow,
  CFormInput,
  CInputGroup,
  CForm,
  CTableHead,
  CTableHeaderCell,
  CTableRow,
  CInput,
  CInputGroupText
} from '@coreui/react';
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
  cilEyedropper,
  cilViewColumn,
  cilEco,
} from '@coreui/icons' 
import { Link, useNavigate } from 'react-router-dom';
import {getJobonEmployee,searchJobGet} from '../../../apiService';



const JobGetEmployeeUserprofile = () => { 
  const navigate = useNavigate()
  const { isAuthenticated } = useAuth();
  const [searchTerm, setSearchTerm] = useState('');
  const [searchResults, setSearchResults] = useState([]);
  const [jobResults, setJobResults] = useState([]);

  const handleChange = (e) => {
    const { name, value } = e.target;
     setSearchTerm((prevUser) => ({ ...prevUser, [name]: value }));
    };

  const handleSearch = (e) => {
    e.preventDefault();
    
    const formData = new FormData();
    formData.append('keyword', searchTerm.keyword);
    searchJobGet(formData)
    .then((response) => {
        setSearchResults(response.data);
    })
    .catch((error) => {
      console.error('Job Post error', error);
    });
  };

  const handleButtonJobOpen = (jobId) => {
    console.log(jobId,"Job Id");
    navigate(`/job-view/${jobId}`);
  };

  useEffect(() => {
    getJobonEmployee()
    .then((r) => {
        console.log(r,"Job Get");
        setSearchResults(r.data.job);
        setJobResults(r.data.userJobPosts);
    })
    .catch((e) => {
        if(e.response.status == 401)
        {
            localStorage.removeItem('_token');
        }
    });
  }, []); // Empty dependency array to ensure the effect runs only once

  const isJobInUserPosts = (jobId) => {
    return jobResults.some((userJob) => userJob.id === jobId);
  };

return (
    <>
    <div>
      <CCard>
      <CCardBody>
        <CForm onSubmit={handleSearch}>
          <CRow>
             <CCol lg={10} className="text-right">
                <CInputGroup className="mb-3">
                    <CInputGroupText>
                    Search Jobs
                    </CInputGroupText>
                    <CFormInput
                    onChange={handleChange}
                    placeholder="Enter job title, keywords, etc."
                    name="keyword"
                    type='text'
                    />
                </CInputGroup>
             </CCol>
            <CCol lg={2} className="text-right">
              <CButton style={{float:'right'}} type="submit" color="primary" className="px-4">
                Find Jobs
              </CButton>
            </CCol>
          </CRow>
        </CForm>

        {/* Display search results */}
        <CTable striped>
            <CTableHead>
              <CTableRow>
                <CTableHeaderCell scope="col">ID</CTableHeaderCell>
                <CTableHeaderCell scope="col">Job</CTableHeaderCell>
                <CTableHeaderCell scope="col">Location</CTableHeaderCell>
                <CTableHeaderCell scope="col">Description</CTableHeaderCell>
                <CTableHeaderCell scope="col">Action</CTableHeaderCell>
                {/* Add more header cells as needed */}
              </CTableRow>
            </CTableHead> 
            <CTableBody>
                {searchResults.map((job, index) => (
                    <CTableRow key={index}>
                    <CTableDataCell>{index + 1}</CTableDataCell>
                    <CTableDataCell>{job.title}</CTableDataCell>
                    <CTableDataCell>{job.location}</CTableDataCell>
                    <CTableDataCell>{job.description}</CTableDataCell>
                    {isJobInUserPosts(job.id) ?<CTableDataCell style={{color:'green'}}>APPLIED</CTableDataCell> : 
                    <CTableDataCell><CButton type="submit" onClick={() => handleButtonJobOpen(job.id)} color="primary" className="px-4"><CIcon icon={cilEco   } className="me-2" /></CButton></CTableDataCell>
                    }
                    </CTableRow>
                ))}
            </CTableBody>
        </CTable>

      </CCardBody>
    </CCard>
    </div>
    
    </>
  )
}

export default JobGetEmployeeUserprofile
