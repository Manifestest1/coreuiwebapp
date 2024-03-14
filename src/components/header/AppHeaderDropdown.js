import { GoogleLogout } from 'react-google-login';
import React,{ useEffect, useState } from 'react';
import {
  CAvatar,
  CBadge,
  CDropdown,
  CDropdownDivider,
  CDropdownHeader,
  CDropdownItem,
  CDropdownMenu,
  CDropdownToggle,
} from '@coreui/react'
import {
  cilUser,
  cilObjectGroup,
} from '@coreui/icons'
import CIcon from '@coreui/icons-react'
import { useNavigate } from 'react-router-dom'
import { gapi } from 'gapi-script';
import {getUserProfile,logoutUserProfile,getClientId} from '../../apiService';

const client_id = getClientId();

const AppHeaderDropdown = () => {
  const navigate = useNavigate()
  const [userImage, setUserImage] = useState('');

  const handleProfileClick = () => {
    navigate('/user-profile');
  };
  const handleEmployerProfileClick = () => {
    navigate('/employer-profile');
  };

  const handleEmployergetJobClick = () => {
    navigate('job-get-employer');
  }

  const handleEmployeegetJobClick = () => {
    navigate('/job-get-employee');
  }

  useEffect(() => {
    getUserProfile()
    .then((r) => {
        setUserImage(r.data);
    })
    .catch((e) => {
        console.log(e)
    });

    function start() 
    {
      // Initialize Google API client
      gapi.client.init({
        clientId: client_id,
        scope: "",
      }).then(() => {
        // Client is initialized, you can now make API calls
        console.log('Google API client initialized');
      }).catch((error) => {
        console.error('Error initializing Google API client:', error);
      });
    }

    // Load the Google API client library
    gapi.load('client', start);
  }, []); // Empty dependency array to ensure the effect runs only once
const onSuccess = () => {

        logoutUserProfile()
        .then((r) => {
          localStorage.removeItem('_token');
          navigate("/");
        })
        .catch((e) => {
          console.error(e);
        });
  };
  return (
    <CDropdown variant="nav-item">
      <CDropdownToggle placement="bottom-end" className="py-0" caret={false}>
        <CAvatar src={userImage.imageurl} size="md" />
      </CDropdownToggle>
      <CDropdownMenu className="pt-0" placement="bottom-end">
        {userImage.role_id == '1' && (
        <CDropdownItem onClick={handleProfileClick} style={{ cursor: 'pointer' }}>
          <CIcon icon={cilUser} className="me-2" />
          Profile
        </CDropdownItem>
        )}
         {userImage.role_id == '2' && (
        <CDropdownItem onClick={handleEmployerProfileClick} style={{ cursor: 'pointer' }}>
          <CIcon icon={cilUser} className="me-2" />
         Profile
        </CDropdownItem>
         )}
          {userImage.role_id == '1' && (
        <CDropdownItem onClick={handleEmployeegetJobClick} style={{ cursor: 'pointer' }}>
          <CIcon icon={cilObjectGroup} className="me-2" />
         Job
        </CDropdownItem>
         )}
         {userImage.role_id == '2' && (
        <CDropdownItem onClick={handleEmployergetJobClick} style={{ cursor: 'pointer' }}>
          <CIcon icon={cilObjectGroup} className="me-2" />
          Job
        </CDropdownItem>
         )}


         <CDropdownItem clientId={client_id} onLogoutSuccess={onSuccess} style={{ cursor: 'pointer' }}>
          <CIcon icon={cilUser} className="me-2" />
          Logout
        </CDropdownItem>

        <CDropdownItem>
          {/* Custom styling for the GoogleLogout component */}
          <div style={{ cursor: 'pointer', display: 'flex', alignItems: 'center' }}>
            {/* Use the Logout component */}
            <GoogleLogout
              clientId={client_id}
              onLogoutSuccess={onSuccess}
             
            />
          </div>
        </CDropdownItem>
        <GoogleLogout
              clientId={client_id}
              onLogoutSuccess={onSuccess}
             
            />
      </CDropdownMenu>
    </CDropdown>
  )
}

export default AppHeaderDropdown
