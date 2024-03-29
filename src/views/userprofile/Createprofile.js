import React,{ useEffect, useState } from 'react'
import useAuth from '../../useAuth';
import { CDropdown, CDropdownItem, CDropdownMenu, CDropdownToggle, CContainer, CRow, CCol,  CForm,
    CFormInput,
    CInputGroup,
    CInputGroupText,CButton,
    CCard,
    CCardBody,
    CCardGroup, } from '@coreui/react';
import { Link, useNavigate } from 'react-router-dom'
import {getUserProfile,createUserProfile} from '../../apiService';

const Createprofile = () => { 
    const [user, setUser] = useState({})
    const [selectedRole, setSelectedRole] = useState('');
    const navigate = useNavigate();
    const handleRoleChange = (value) => {
      setSelectedRole(value);
    };
    
    const { isAuthenticated } = useAuth();
  
    useEffect(()=>{
       getUser()
    },[])

    const getUser = () => {
        getUserProfile()
        .then((r) => {
            console.log(r.data.role_id,"Get User");
            setUser(r.data)
            
            if(r.data.role_id == 1)
            {
                 navigate('/dashboard')
            }
            if(r.data.role_id == 2)
            {
                navigate('/employer-dashboard')
            }
          
        })
        .catch((e) => {
            if(e.response.status == 401)
            {
                // localStorage.removeItem('_token');
                // navigate('/login');
                console.log(e.response.status,"In condition")
            }
        });
    }
  
    const handleSubmit = async (e) => {
      e.preventDefault();
  
      try {
        const response = await createUserProfile(selectedRole);
        if(response.data.role_id == 1)
        {
            navigate('/dashboard')
        }
        else
        {
            navigate('/employer-dashboard')
        }
        
      } 
      catch (error) 
      {
        console.error('Error submitting data:', error);
      }
    };  
 
 return (
    <>
      
      <div className="bg-light d-flex flex-row align-items-center">
      <CContainer>
        <CRow className="justify-content-center">
        <CCol md={8}>
            <CCardGroup>
            <CCard className="p-4">
                <CCardBody>
                <CForm onSubmit={handleSubmit}>
                    <label className="px-4" htmlFor="role">Select Role:</label>
                    <CDropdown>
                        <CDropdownToggle color="primary">Select Role</CDropdownToggle>
                        <CDropdownMenu>
                        <CDropdownItem onClick={() => handleRoleChange('employee')}>Employee</CDropdownItem>
                        <CDropdownItem onClick={() => handleRoleChange('employer')}>Employer</CDropdownItem>
                        </CDropdownMenu>
                    </CDropdown>
                    {selectedRole && (
                        <div>
                        You selected: {selectedRole === 'employee' ? 'Employee' : 'Employer'}
                        </div>
                    )}
                    <CRow>
                        <CCol md={12} className="mt-4">
                        <CButton type="submit" color="primary" className="px-8 text-center">
                            Submit
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
    
    </>
  )
}

export default Createprofile
