import React, { useEffect, useState } from 'react'
import Dialog from '@mui/material/Dialog';
import DialogTitle from '@mui/material/DialogTitle';
import DialogContent from '@mui/material/DialogContent';
import DialogContentText from '@mui/material/DialogContentText';
import DialogActions from '@mui/material/DialogActions';
import Button from '@mui/material/Button';
import { gapi } from 'gapi-script'
import { Link, useNavigate } from 'react-router-dom'
import axiosInstance from '../../api';


const DialogCompnent = ({ open, onClose,login })=>{
    const navigate = useNavigate();

    // Login With Google Code

    // const handleLogin = () => {
    //    onClose();
    //     gapi.auth2.getAuthInstance().signIn({
    //       scope: 'openid profile email',
    //       prompt: 'select_account', // Forces account chooser
    //     }).then((googleUser) => {
    //       // Handle successful login
    //       let payload = { email: googleUser.wt.cu, name: googleUser.wt.Ad, google_id: googleUser.wt.NT,imageurl: googleUser.wt.hK,password: "12345678"}
       
    //       let headers = { 'Content-Type': 'application/json' }
    //       axiosInstance.post('/login',payload,headers).then((r) => { 
    //         console.log(r.data,"Api Response In Login Side")
    //           if(r.data.authorisation.token)
    //           {
    //             localStorage.setItem('_token', r.data.authorisation.token)
    //             navigate('/job_listing')
    //           }
    //         })
          
    //     }).catch((error) => {
    //       // Handle login error
    //       console.error('Error signing in with Google:', error);
    //     });
    //   };

    // Login With Google Code

    return(
        <>
    <div stlye={{}}>
    <Dialog open={open} onClose={onClose}>
    <DialogTitle class="section-tittle text-center" style={{ textAlign: 'center',fontSize: '25px',padding:'50px',fontWeight:'800'}}>{"User Signin & Signup By Google Account."}</DialogTitle>
      <DialogContent>
        <DialogContentText>
          {/* I am Good, Hope the same for you! */}
        </DialogContentText>
        <Button class="btn head-btn2" onClick={login} autoFocus style={{ display: 'block', margin: 'auto' }}>
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