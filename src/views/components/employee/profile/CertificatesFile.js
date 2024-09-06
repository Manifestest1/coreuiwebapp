import React, { useState } from 'react';
import { TextField, Button, Stack, Box } from '@mui/material';
import AddIcon from '@mui/icons-material/Add';
import RemoveIcon from '@mui/icons-material/Remove';

const CertificatesFile = ({ inputs = [], handleInputChange, addInputField, removeInputField,handleSubmit }) => {
    // State to manage the list of input fields

    return (
        <Box sx={{ padding: 2 }}>
            <form onSubmit={handleSubmit}>
            {inputs.map(input => (
                <Stack key={input.id} spacing={2} direction="column" alignItems="center">
                     <div className='row'>

                        <div className='col-lg-2'>
                            <label className='mt-30'>Certificate Name</label>
                        </div>
                        <div className='col-lg-4'>
                            <input className="form-control mt-30" type="text" name="certificate_name" value={input.certificate_name} onChange={(e) => handleInputChange(input.id, e)}/>
                        </div>
                    
                        <div className='col-lg-2'>
                            <label className='mt-30'> Date of Certification</label>
                        </div>
                        <div className='col-lg-4'>
                            <input className="form-control mt-30" type="date"  name="date_of_certification" value={input.date_of_certification} onChange={(e) => handleInputChange(input.id, e)}/> 
                        </div>

                        <div className='col-lg-2'>
                            <label className='mt-30'>Issuing Organization</label>
                        </div>
                        <div className='col-lg-4'>
                            <input className="form-control mt-30" type="text"  name="issuing_organization" value={input.issuing_organization} onChange={(e) => handleInputChange(input.id, e)}/> 
                        </div>
                    </div> 

                        <Stack direction="row" spacing={2} alignItems="center">
                            <Button
                                variant="contained"
                                className="genric-btn success-border radius mt-30"
                                onClick={addInputField}
                                startIcon={<AddIcon />}
                            >
                                Add
                            </Button>
                            <Button
                                variant="contained"
                                className="genric-btn success-border radius mt-30"
                                onClick={() => removeInputField(input.id)}
                                startIcon={<RemoveIcon />}
                                sx={{ marginLeft: 2 }} // Adjust the margin here
                            >
                                Remove
                            </Button>
                        </Stack>  
                </Stack>
            ))}

                </form>
        </Box>
    );
};

export default CertificatesFile;
