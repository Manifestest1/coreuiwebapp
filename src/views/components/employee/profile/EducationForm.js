import React from 'react';
import { Button, Stack, Box } from '@mui/material';
import AddIcon from '@mui/icons-material/Add';
import RemoveIcon from '@mui/icons-material/Remove';

const EducationForm = ({ inputs = [], handleInputChange, addInputField, removeInputField }) => {
    return (
        <>
            <label className='mt-30'>Education</label>
            <div className='row'>
                <label className='col-lg-10 d-flex justify-content-end'>Add New Education</label>
                <Button
                    sx={{ borderRadius: '50%' }}
                    variant="contained"
                    className="genric-btn success-border"
                    startIcon={<AddIcon />}
                    onClick={addInputField}
                >
                </Button>
            </div>
            {inputs.map((input, index) => (
                <React.Fragment key={input.id}>
                    <Stack direction="row" spacing={2} alignItems="center" sx={{ marginTop: index === 0 ? '0' : '30px' }}>
                        <Box sx={{ border: '1px solid #ced4da', width: '83%', padding: '20px' }}>
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
                                <label className='d-flex justify-content-end col-lg-2'>To Year</label>
                                <input
                                    className="col-lg-3 form-control"
                                    type="date"
                                    name="to_year"
                                    value={input.to_year}
                                    onChange={(e) => handleInputChange(input.id, e)}
                                />
                            </div>

                            <div className='row mt-30'>
                                <label className='d-flex justify-content-end col-lg-2'>Grade</label>
                                <input
                                    className="col-lg-3 form-control"
                                    type="text"
                                    name="grading"
                                    value={input.grading}
                                    onChange={(e) => handleInputChange(input.id, e)}
                                />
                                <label className='d-flex justify-content-end col-lg-2'>Description</label>
                                <input
                                    className="col-lg-3 form-control"
                                    type="text"
                                    name="description"
                                    value={input.description}
                                    onChange={(e) => handleInputChange(input.id, e)}
                                />
                            </div>
                        </Box>

                        <Button
                            variant="contained"
                            className="genric-btn success-border"
                            startIcon={<RemoveIcon />}
                            onClick={() => removeInputField(input.id)}
                            sx={{ height: '50%', alignSelf: 'center', borderRadius: '50%' }}
                        >
                        </Button>
                    </Stack>
                </React.Fragment>
            ))}
        </>
    );
};

export default EducationForm;
