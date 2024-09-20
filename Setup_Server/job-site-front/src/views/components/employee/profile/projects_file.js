import React, { useState } from 'react';
import { TextField, Button, Stack, Box } from '@mui/material';
import AddIcon from '@mui/icons-material/Add';
import RemoveIcon from '@mui/icons-material/Remove';

const DynamicForm = ({ inputs = [], handleInputChange, addInputField, removeInputField,handleSubmit }) => {
    // State to manage the list of input fields

    return (
        <Box sx={{ padding: 2 }}>
            <form onSubmit={handleSubmit}>
            {inputs.map(input => (
                <Stack key={input.id} spacing={2} direction="column" alignItems="center">
                     <div className='row' >

                        <div className='col-lg-2'>
                            <label className='mt-30'>Project Title</label>
                        </div>
                        <div className='col-lg-4'>
                            <input className="form-control mt-30" type="text" name="projectName" value={input.projectName} onChange={(e) => handleInputChange(input.id, e)}/>
                        </div>
                    
                        <div className='col-lg-2'>
                            <label className='mt-30'>Brief Description</label>
                        </div>
                        <div className='col-lg-4'>
                            <input className="form-control mt-30" type="text"  name="briefDescription" value={input.briefDescription} onChange={(e) => handleInputChange(input.id, e)}/> 
                        </div>
                    
                        <div className='col-lg-2'>
                            <label className='mt-30'>Role and Contributions</label>
                        </div>
                        <div className='col-lg-4'>
                            <input className="form-control mt-30" type="text"  name="roleAndContributions" value={input.roleAndContributions} onChange={(e) => handleInputChange(input.id, e)}/>
                        </div>
                        
                        <div className='col-lg-2'>
                            <label className='mt-30'>Technologies Used</label>
                        </div>
                        <div className='col-lg-4'>
                            <input className="form-control mt-30" type="text" name="technologiesUsed" value={input.technologiesUsed} onChange={(e) => handleInputChange(input.id, e)}/>
                        </div>
                    </div>
                   
                    <Stack direction="row" spacing={2} alignItems="center">
                            <Button
                                variant="contained"
                                className="genric-btn success-border radius mt-30"
                                onClick={addInputField}
                                startIcon={<AddIcon />}
                            >
                                
                            </Button>
                            <Button
                                variant="contained"
                                className="genric-btn success-border radius mt-30"
                                onClick={() => removeInputField(input.id)}
                                startIcon={<RemoveIcon />}
                                sx={{ marginLeft: 2 }} // Adjust the margin here
                            >
                               
                            </Button>
                        </Stack>
                    </Stack>
                ))}
            </form>
        </Box>
    );
};

export default DynamicForm;
