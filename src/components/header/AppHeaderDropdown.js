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
  CButton
} from '@coreui/react'
import {
  cilUser,
  cilObjectGroup,
  cilAccountLogout
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
    const initGoogleAuth = async () => {
      try {
        await gapi.auth2.init({
          client_id: client_id,
          scope: 'openid profile email',
        });
        console.log('Google API client initialized');
      } 
      catch (error) 
      {
        console.error('Error initializing Google API client:', error);
      }
    };

    if (typeof gapi !== 'undefined' && typeof gapi.auth2 === 'object' && !gapi.auth2.getAuthInstance()) 
    {
      initGoogleAuth();
    }

    getUserProfile()
        .then((r) => {
            setUserImage(r.data);
        })
        .catch((e) => {
            console.log(e)
        });

  }, []);

  const handleLogout = async () => {
    try {
      const authInstance = gapi.auth2.getAuthInstance();
      await authInstance.signOut();

      // Clear authentication-related information
      logoutUserProfile()
        .then((r) => {
          localStorage.removeItem('_token');
          navigate("/login");
        })
        .catch((e) => {
          console.error(e);
        });

      // Redirect to the logout page or perform other necessary actions
      navigate("/login");
    } catch (error) {
      console.error('Error during logout:', error);
    }
  };

//   useEffect(() => {
    
//     function start() 
//     {
//       // Initialize Google API client 
//       gapi.client.init({
//         clientId: client_id,
//         scope: "",
//       }).then(() => {
//         // Client is initialized, you can now make API calls
//         console.log('Google API client initialized');
//       }).catch((error) => {
//         console.error('Error initializing Google API client:', error);
//       });
//     }

//     // Load the Google API client library
//     gapi.load('client', start);

//     getUserProfile()
//     .then((r) => {
//         setUserImage(r.data);
//     })
//     .catch((e) => {
//         console.log(e)
//     });

//   }, []); // Empty dependency array to ensure the effect runs only once
// const onSuccess = () => {

//         logoutUserProfile()
//         .then((r) => {
//           localStorage.removeItem('_token');
//           navigate("/login");
//         })
//         .catch((e) => {
//           console.error(e);
//         });
//   };
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
        <CDropdownDivider />
        <CDropdownItem href="#">
          {/* Use the Logout component */}
          {/* <GoogleLogout
            clientId={client_id}
            buttonText="Logout"
            onLogoutSuccess={onSuccess}
            /> */}

          <CButton  onClick={handleLogout}>
              <CIcon icon={cilAccountLogout} className="me-2" />Sign out
          </CButton>
        </CDropdownItem>
      </CDropdownMenu>
    </CDropdown>
  )
}

export default AppHeaderDropdown
