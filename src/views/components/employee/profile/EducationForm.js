import React from 'react';
import {  Button, Stack, Box } from '@mui/material';
import AddIcon from '@mui/icons-material/Add';
import RemoveIcon from '@mui/icons-material/Remove';

const EducationForm = ({ inputs = [], handleInputChange, addInputField, removeInputField }) => {
    return (
        <Box sx={{ padding: 2 }}>
            {inputs.map((input, index) => (
                <Stack  key={input.id} spacing={2} direction="column" alignItems="center">
                    <div className='row'>

                        <div className='col-lg-2'>
                            <label className='mt-30'>Institute Name</label>
                        </div>
                        <div className='col-lg-4'>
                            <input
                                className="mt-30 form-control"
                                fullWidth
                                type="text"
                                name="institution_names"
                                value={input.institution_names}
                                onChange={(e) => handleInputChange(input.id, e)}
                                variant="outlined"
                            />
                        </div>

                        <div className='col-lg-2'>
                            <label className='mt-30'>Course </label>
                        </div>
                        <div className='col-lg-4'>
                            <input
                                className="mt-30 form-control"
                                fullWidth
                                type="text"
                                name="course"
                                value={input.course}
                                onChange={(e) => handleInputChange(input.id, e)}
                                variant="outlined"
                            />
                        </div>

                        <div className='col-lg-2'>
                            <label className='mt-30'>From Year</label>
                        </div>
                        <div className='col-lg-4'>
                            <input
                                className="mt-30 form-control"
                                fullWidth
                                type="date"
                                name="from_year"
                                value={input.from_year}
                                onChange={(e) => handleInputChange(input.id, e)}
                                variant="outlined"
                            />
                        </div>

                        <div className='col-lg-2'>
                            <label className='mt-30'>Role of Employee</label>
                        </div>
                        <div className='col-lg-4'>
                            <input
                                className="mt-30 form-control"
                                fullWidth
                                type="text"
                                name="from_year"
                                value={input.role_of_employee}
                                onChange={(e) => handleInputChange(input.id, e)}
                                variant="outlined"
                            />
                        </div>

                        <div className='col-lg-2'>
                            <label className='mt-30'>To Year</label>
                        </div>
                        <div className='col-lg-4'>
                            <input
                                className="mt-30 form-control"
                                fullWidth
                                type="date"
                                name="to_year"
                                value={input.to_year}
                                onChange={(e) => handleInputChange(input.id, e)}
                                variant="outlined"
                            />
                        </div>

                    <div className='col-lg-2'>
                        <label className='mt-30'>Grade</label>
                    </div>
                    <div className='col-lg-4'>
                        <input
                            className="mt-30 form-control"
                            fullWidth
                            type="text"
                            name="grading"
                            value={input.grading}
                            onChange={(e) => handleInputChange(input.id, e)}
                            variant="outlined"
                        />
                    </div>

                    <div className='col-lg-2'>
                        <label className='mt-30'>Description </label>
                    </div>
                    <div className='col-lg-4'>
                        <input
                            className="mt-30 form-control"
                            fullWidth
                            type="text"
                            name="description"
                            value={input.description}
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
                            Remove Education 
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
                    Add Education
                </Button>
            </Stack>
        </Box>
    );
};

export default EducationForm;
