import React from 'react'
import Dialog from '@mui/material/Dialog';
import DialogTitle from '@mui/material/DialogTitle';
import DialogContent from '@mui/material/DialogContent';
import DialogContentText from '@mui/material/DialogContentText';
import DialogActions from '@mui/material/DialogActions';
import Button from '@mui/material/Button';

const DialogCompnent = ({ open, onClose,login })=>{ 

  return(
    <>
      <div stlye={{}}>
        <Dialog open={open} onClose={onClose}>
          <DialogTitle class="section-tittle text-center" id="dialog-title" >{"User Signin & Signup By Google Account."}</DialogTitle>
          <DialogContent>
            <DialogContentText>
            </DialogContentText>
            <Button class="btn head-btn2" onClick={login} autoFocus id='dialog-login'>
              Login With Google
            </Button>
          </DialogContent>
          <DialogActions>
            <Button class="btn" onClick={onClose} autoFocus>
              Close
            </Button>
          </DialogActions>
        </Dialog>
      </div>
    </>
  )
}

export default DialogCompnent