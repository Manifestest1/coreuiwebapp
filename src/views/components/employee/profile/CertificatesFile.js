import React from 'react';
import { TextField, Button, Stack, Box } from '@mui/material';
import AddIcon from '@mui/icons-material/Add';
import RemoveIcon from '@mui/icons-material/Remove';

const CertificatesFile = ({ inputs = [], handleInputChange, addInputField, removeInputField }) => {
    return (
        <Box sx={{ padding: 2 }}>
            {inputs.map((input) => (
                <Stack key={input.id} spacing={2} direction="column" alignItems="center">
                    <div className='row'>

                        <div className='col-lg-2'>
                            <label className='mt-30'>Certificate Name</label>
                        </div>
                        <div className='col-lg-4'>
                            <input
                                className="mt-30 form-control"
                                fullWidth
                                type="text"
                                name="certificate_name"
                                value={input.certificate_name}
                                onChange={(e) => handleInputChange(input.id, e)}
                                variant="outlined"
                            />
                        </div>

                        <div className='col-lg-2'>
                            <label className='mt-30'>Date of Certification</label>
                        </div>
                        <div className='col-lg-4'>
                            <input
                                className="mt-30 form-control"
                                fullWidth
                                type="date"
                                name="date_of_certification"
                                value={input.date_of_certification}
                                onChange={(e) => handleInputChange(input.id, e)}
                                variant="outlined"
                            />
                        </div>

                        <div className='col-lg-2'>
                            <label className='mt-30'>Issuing Organization</label>
                        </div>
                        <div className='col-lg-4'>
                            <input
                                className="mt-30 form-control"
                                fullWidth
                                type="text"
                                name="issuing_organization"
                                value={input.issuing_organization}
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
                                name="grade"
                                value={input.grade}
                                onChange={(e) => handleInputChange(input.id, e)}
                                variant="outlined"
                            />
                        </div>

                        <div className='col-lg-2'>
                            <label className='mt-30'>Description</label>
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

                    <Button
                        variant="contained"
                        className="genric-btn success-border radius "
                        onClick={() => removeInputField(input.id)}
                        startIcon={<RemoveIcon />}
                    >
                        Remove Certificate
                    </Button>
                </Stack>
            ))}

            <Stack direction="row" spacing={2} alignItems="center" justifyContent="center" sx={{ marginTop: 2 }}>
                <Button
                    variant="contained"
                    className="genric-btn success-border radius "
                    onClick={addInputField}
                    startIcon={<AddIcon />}
                >
                    Add Certificate
                </Button>
            </Stack>
        </Box>
    );
};

export default CertificatesFile;
