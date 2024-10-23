import React from 'react';
import { Button, Stack, Box } from '@mui/material';

const DynamicForm = ({ inputs = [], handleInputChange, addInputField, removeInputField }) => {
    return (
        <>
            <div className='row mt-30'>
                <label className='col-lg-8'>Projects</label>
                <Button
                    sx={{ marginBottom: 2 }}
                    variant="contained"
                    className="genric-btn success-border radius col-lg-2"
                    onClick={addInputField}
                >
                    Add Projects
                </Button>
            </div>
            
            {inputs.map((input, index) => (
                <React.Fragment key={input.id}>
                    <Stack direction="row" spacing={2} alignItems="center" sx={{ marginTop: index === 0 ? '0' : '30px' }}>
                        <Box sx={{ border: '1px solid #ced4da', width: '75%', padding: '20px' }}>
                            <div className='row mt-30'>
                                <label className='d-flex justify-content-end col-lg-2'>Project Title</label>
                                <input
                                    className="form-control col-lg-3"
                                    type="text"
                                    name="project_name"
                                    value={input.project_name}
                                    onChange={(e) => handleInputChange(input.id, e)}
                                />
                                <label className='d-flex justify-content-end col-lg-2'>Company Image</label>
                                <input
                                    className="col-lg-3 form-control"
                                    type="text"
                                    name="company_image"
                                    value={input.company_image}
                                    onChange={(e) => handleInputChange(input.id, e)}
                                />
                            </div>

                            <div className='row mt-30'>
                                <label className='d-flex justify-content-end col-lg-2'>Technology</label>
                                <input
                                    className="col-lg-3 form-control"
                                    type="text"
                                    name="technologies_used"
                                    value={input.technologies_used}
                                    onChange={(e) => handleInputChange(input.id, e)}
                                />
                                <label className='d-flex justify-content-end col-lg-2'>Role and Contributions</label>
                                <input
                                    className="col-lg-3 form-control"
                                    type="text"
                                    name="role_of_employee"
                                    value={input.role_of_employee}
                                    onChange={(e) => handleInputChange(input.id, e)}
                                />
                            </div>

                            <div className='row mt-30'>
                                <label className='d-flex justify-content-end col-lg-2'>Description</label>
                                <input
                                    className="col-lg-8 form-control"
                                    type="text"
                                    name="brief_description"
                                    value={input.brief_description}
                                    onChange={(e) => handleInputChange(input.id, e)}
                                />
                            </div>
                        </Box>

                        <Button
                            variant="contained"
                            className="genric-btn success-border radius col-lg-2"
                            onClick={() => removeInputField(input.id)}
                            sx={{
                                height: '50%',  
                                alignSelf: 'center'  
                            }}
                        >
                            Remove Projects 
                        </Button>
                    </Stack>
                </React.Fragment>
            ))}
        </>
    );
};

export default DynamicForm;
