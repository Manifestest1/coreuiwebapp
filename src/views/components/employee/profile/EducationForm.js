import React from 'react';
import { Button, Stack, Box } from '@mui/material';

const EducationForm = ({ inputs = [], handleInputChange, addInputField, removeInputField }) => {
    return (
        <>
            <div className='row mt-30'>
                <label className='col-lg-8'>Education</label>
                <Button
                    sx={{ marginBottom: 2 }}
                    variant="contained"
                    className="genric-btn success-border radius col-lg-2"
                    onClick={addInputField}
                >
                    Add Education
                </Button>
            </div>
            {inputs.map((input, index) => (
                <React.Fragment key={input.id}>
                    <Stack direction="row" spacing={2} alignItems="center" sx={{ marginTop: index === 0 ? '0' : '30px' }}>
                        <Box sx={{ border: '1px solid #ced4da', width: '75%', padding: '20px' }}>
                            <div className='row'>
                                <label className='d-flex justify-content-end col-lg-2'>Institute Name</label>
                                <input
                                    className="col-lg-3 form-control"
                                    type="text"
                                    name="institution_names"
                                    value={input.institution_names}
                                    onChange={(e) => handleInputChange(input.id, e)}
                                />
                                <label className='d-flex justify-content-end col-lg-2'>Course</label>
                                <input
                                    className="col-lg-3 form-control"
                                    type="text"
                                    name="course"
                                    value={input.course}
                                    onChange={(e) => handleInputChange(input.id, e)}
                                />
                            </div>

                            <div className='row mt-30'>
                                <label className='d-flex justify-content-end col-lg-2'>From Year</label>
                                <input
                                    className="col-lg-3 form-control"
                                    type="date"
                                    name="from_year"
                                    value={input.from_year}
                                    onChange={(e) => handleInputChange(input.id, e)}
                                />
                                <label className='d-flex justify-content-end col-lg-2'>Role of Employee</label>
                                <input
                                    className="col-lg-3 form-control"
                                    type="text"
                                    name="role_of_employee"
                                    value={input.role_of_employee}
                                    onChange={(e) => handleInputChange(input.id, e)}
                                />
                            </div>

                            <div className='row mt-30'>
                                <label className='d-flex justify-content-end col-lg-2'>To Year</label>
                                <input
                                    className="col-lg-3 form-control"
                                    type="date"
                                    name="to_year"
                                    value={input.to_year}
                                    onChange={(e) => handleInputChange(input.id, e)}
                                />
                                <label className='d-flex justify-content-end col-lg-2'>Grade</label>
                                <input
                                    className="col-lg-3 form-control"
                                    type="text"
                                    name="grading"
                                    value={input.grading}
                                    onChange={(e) => handleInputChange(input.id, e)}
                                />
                            </div>

                            <div className='row mt-30'>
                                <label className='d-flex justify-content-end col-lg-2'>Description</label>
                                <input
                                    className="col-lg-8 form-control"
                                    type="text"
                                    name="description"
                                    value={input.description}
                                    onChange={(e) => handleInputChange(input.id, e)}
                                />
                            </div>
                        </Box>

                        <Button
                            variant="contained"
                            className="genric-btn success-border radius col-lg-2"
                            onClick={() => removeInputField(input.id)}
                            sx={{ height: '50%', alignSelf: 'center' }}
                        >
                            Remove Education 
                        </Button>
                    </Stack>
                </React.Fragment>
            ))}
        </>
    );
};

export default EducationForm;
