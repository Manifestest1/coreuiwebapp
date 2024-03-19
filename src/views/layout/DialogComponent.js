import React from "react";
import Dialog from '@mui/material/Dialog';
import DialogTitle from '@mui/material/DialogTitle';
import DialogContent from '@mui/material/DialogContent';
import DialogContentText from '@mui/material/DialogContentText';
import DialogActions from '@mui/material/DialogActions';
import Button from '@mui/material/Button';

const DialogCompnent = ({ open, onClose })=>{
    return(
        <>
    <div stlye={{}}>
    <Dialog open={open} onClose={onClose}>
    <DialogTitle style={{ textAlign: 'center' }}>{"User Signin & Signup by Google Account."}</DialogTitle>
      <DialogContent>
        <DialogContentText>
          {/* I am Good, Hope the same for you! */}
        </DialogContentText>
        <Button class="btn head-btn2" onClick={onClose} autoFocus style={{ display: 'block', margin: 'auto' }}>
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