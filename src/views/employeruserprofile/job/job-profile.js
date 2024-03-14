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
import {cilEco} from '@coreui/icons' 
import { useNavigate } from 'react-router-dom';
import {getJobonEmployer,searchJobGet} from '../../../apiService';

const JobGetEmployerUserprofile = () => { 
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
    navigate(`/job-view-employer/${jobId}`);
  };

  const handleCreateJobPost = () => {
     navigate('/job-post');
  }

  useEffect(() => {
    getJobonEmployer()
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

 

return (
    <>
    <div>
      <CCard>
      <CCardBody>
        <CForm onSubmit={handleSearch}>
          <CRow>
             <CCol lg={8} className="text-right">
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
              <CButton style={{float:'right'}} type="submit" color="info" className="px-4">
                Find Jobs
              </CButton>
            </CCol>
            <CCol lg={2} className="text-right">
              <CButton onClick={handleCreateJobPost} style={{float:'right'}} type="submit" color="info" className="px-4">
                Job Create
              </CButton>
            </CCol>
          </CRow>
        </CForm>

        {/* Display search results */}
        <CTable striped>
            <CTableHead className="text-center">
              <CTableRow>
                <CTableHeaderCell scope="col">ID</CTableHeaderCell>
                <CTableHeaderCell scope="col">Job</CTableHeaderCell>
                <CTableHeaderCell scope="col">Location</CTableHeaderCell>
                <CTableHeaderCell scope="col">Description</CTableHeaderCell>
                <CTableHeaderCell scope="col">Action</CTableHeaderCell>
                {/* Add more header cells as needed */}
              </CTableRow>
            </CTableHead> 
            <CTableBody className="text-center">
                {searchResults.map((job, index) => (
                    <CTableRow key={index}>
                    <CTableDataCell>{index + 1}</CTableDataCell>
                    <CTableDataCell>{job.title}</CTableDataCell>
                    <CTableDataCell>{job.location}</CTableDataCell>
                    <CTableDataCell>{job.description}</CTableDataCell>
                    <CTableDataCell><CButton type="submit" onClick={() => handleButtonJobOpen(job.id)} color="primary" className="px-4"><CIcon icon={cilEco   } className="me-2" /></CButton></CTableDataCell>
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

export default JobGetEmployerUserprofile
