import React,{ useEffect, useState } from 'react'
import useAuth from '../../useAuth';
import {
  CAvatar,
  CButton,
  CCard,
  CCardBody,
  CCol,
  CContainer, 
  CCardFooter,
  CCardHeader,
  CRow,
  CCardTitle
} from '@coreui/react'
import { useNavigate } from 'react-router-dom'
import {getUserProfile} from '../../apiService';

const Userprofile = () => { 
  const navigate = useNavigate()
  const { isAuthenticated } = useAuth();
  const [user, setUser] = useState({});

  // Start PDF Download code
  const pdfRef = useRef();

 const downloadPDF = () => {
    html2canvas(pdfRef.current).then((canvas) => {
      const imgData = canvas.toDataURL('image/png');
      const pdf = new jsPDF('p', 'mm', 'a4');
      pdf.addImage(imgData, 'PNG', 15, 15, 180, 120); // A4 size: 210 x 297 mm
      pdf.save('employer_profile.pdf');
    });
  };

  // End PDF Download code

  useEffect(() => {
    getUserProfile()
    .then((r) => {
      setUser(r.data);
    })
    .catch((e) => {
        console.log(e)
    });
  }, []); // Empty dependency array to ensure the effect runs only once
  
  const handleEditClick = () => {
    navigate('/edit-employer-user-profile');
  };

  return (
    <>
      
      <div className="c-app c-default-layout flex-row align-items-center">
      <CContainer>
        <CRow className="justify-content-center">
          <CCol md="12" lg="12" xl="12">
            <CCard className="mx-4">
              <CCardHeader className="text-center">
                <CCardTitle style={{fontWeight: 400}} className="fw-bold">Employee Profile</CCardTitle>
              </CCardHeader>
              <CCardBody>
                <CRow>
                  <CCol  xs={4}>
                    <img className="text-center" src={user.imageurl}  style={{ borderRadius: 96,height:'100%' ,marginLeft:'65px'}}/>
                  </CCol>
                  <CCol xs={6} style={{fontWeight: '400',fontSize:'18'}}>
                    <h5  style={{ marginTop: 20 }}>Name: {user.name}</h5>
                    <h5 style={{ marginTop: 20 }}>Email: {user.email}</h5>
                    <h5 style={{ marginTop: 20 }}>Role: Employee</h5>
                    <h5 style={{ marginTop: 20 }}>Phone: {user.phone}</h5>
                  </CCol>
                </CRow>
              </CCardBody>
              <CCardFooter>
                <CRow>
                  <CCol xs={4}>
                    
                  </CCol>  
                  <CCol xs={8} className="text-left">
                    <CButton style={{marginRight:20}} color="info" className="px-4" onClick={downloadPDF}>Download PDF</CButton>
                    <CButton color="info" className="px-4" onClick={handleEditClick}>Edit</CButton>
                  </CCol>
                </CRow>
              </CCardFooter>
             
            </CCard>
          </CCol>
        </CRow>
      </CContainer>
    </div>
    
    </>
  )
}

export default Userprofile
