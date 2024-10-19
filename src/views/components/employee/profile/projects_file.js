import React from 'react';
import { TextField, Button, Stack, Box } from '@mui/material';
import AddIcon from '@mui/icons-material/Add';
import RemoveIcon from '@mui/icons-material/Remove';

const DynamicForm = ({ inputs = [], handleInputChange, addInputField, removeInputField }) => {
    return (
        <Box sx={{ padding: 2 }}>
            {inputs.map(input => (
                <Stack key={input.id} spacing={2} direction="column" alignItems="center">
                    <div className='row'>

                        <div className='col-lg-2'>
                            <label className='mt-30'>Project Title</label>
                        </div>
                        <div className='col-lg-4'>
                            <input
                                className="mt-30 form-control"
                                fullWidth
                                type="text"
                                name="project_name"
                                value={input.project_name}
                                onChange={(e) => handleInputChange(input.id, e)}
                                variant="outlined"
                            />
                        </div>

                        <div className='col-lg-2'>
                            <label className='mt-30'>Company Image</label>
                        </div>
                        <div className='col-lg-4'>
                            <input
                                className="mt-30 form-control"
                                fullWidth
                                type="text"
                                name="company_image"
                                value={input.company_image}
                                onChange={(e) => handleInputChange(input.id, e)}
                                variant="outlined"
                            />
                        </div>

                        <div className='col-lg-2'>
                            <label className='mt-30'>Brief Description</label>
                        </div>
                        <div className='col-lg-4'>
                            <input
                                className="mt-30 form-control"
                                fullWidth
                                type="text"
                                name="brief_description"
                                value={input.brief_description}
                                onChange={(e) => handleInputChange(input.id, e)}
                                variant="outlined"
                            />
                        </div>

                        <div className='col-lg-2'>
                            <label className='mt-30'>Role and Contributions</label>
                        </div>
                        <div className='col-lg-4'>
                            <input
                                className="mt-30 form-control"
                                fullWidth
                                type="text"
                                name="role_of_employee"
                                value={input.role_of_employee}
                                onChange={(e) => handleInputChange(input.id, e)}
                                variant="outlined"
                            />
                        </div>

                        <div className='col-lg-2'>
                            <label className='mt-30'>Technologies Used</label>
                        </div>
                        <div className='col-lg-4'>
                            <input
                                className="mt-30 form-control"
                                fullWidth
                                type="text"
                                name="technologies_used"
                                value={input.technologies_used}
                                onChange={(e) => handleInputChange(input.id, e)}
                                variant="outlined"
                            />
                        </div>
                    </div>

                    <Stack direction="row" spacing={2} alignItems="center">
                        <Button
                            variant="contained"
                            className="genric-btn success-border radius "
                            onClick={() => removeInputField(input.id)}
                            startIcon={<RemoveIcon />}
                        >
                            Remove Project
                        </Button>
                    </Stack>
                </Stack>
            ))}

            {/* Single Add Button outside the input fields */}
            <Stack direction="row" spacing={2} alignItems="center" justifyContent="center" sx={{ marginTop: 2 }}>
                <Button
                    variant="contained"
                    className="genric-btn success-border radius "
                    onClick={addInputField}
                    startIcon={<AddIcon />}
                >
                    Add Project
                </Button>
            </Stack>
        </Box>
    );
};

export default DynamicForm;
