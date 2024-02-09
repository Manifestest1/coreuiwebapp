// SuccessPopUp.js
import React from 'react';
import { CModal, CModalHeader, CModalTitle, CModalBody, CModalFooter, CButton } from '@coreui/react';

const SuccessPopUp = ({ isOpen, onClose, message }) => {
  return (
    <CModal show={isOpen} onClose={onClose}>
      <CModalHeader closeButton>
        <CModalTitle>Success!</CModalTitle>
      </CModalHeader>
      <CModalBody>{message}</CModalBody>
      <CModalFooter>
        <CButton color="success" onClick={onClose}>
          Close
        </CButton>
      </CModalFooter>
    </CModal>
  );
};

export default SuccessPopUp;
