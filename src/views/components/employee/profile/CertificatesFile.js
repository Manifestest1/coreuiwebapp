import React from 'react';
import { Button, Stack, Box } from '@mui/material';

const CertificatesFile = ({ inputs = [], handleInputChange, addInputField, removeInputField }) => {
    return (
        <>
            <div className='row mt-30'>
                <label className='col-lg-8'>Certificates</label>
                <Button
                    sx={{ marginBottom: 2 }}
                    variant="contained"
                    className="genric-btn success-border radius col-lg-2"
                    onClick={addInputField}
                >
                    Add Certificates
                </Button>
            </div>
            {inputs.map((input, index) => (
                <React.Fragment key={input.id}>
                    <Stack direction="row" spacing={2} alignItems="center" sx={{ marginTop: index === 0 ? '0' : '30px' }}>
                        <Box sx={{ border: '1px solid #ced4da', width: '75%', padding: '20px' }}>
                            <div className='row mt-30'>
                                <label className='d-flex justify-content-end col-lg-2'>Certificate Name</label>
                                <input
                                    className="col-lg-3 form-control"
                                    type="text"
                                    name="certificate_name"
                                    value={input.certificate_name}
                                    onChange={(e) => handleInputChange(input.id, e)}
                                />
                                <label className='d-flex justify-content-end col-lg-2'>Date of Certification</label>
                                <input
                                    className="col-lg-3 form-control"
                                    type="date"
                                    name="date_of_certification"
                                    value={input.date_of_certification}
                                    onChange={(e) => handleInputChange(input.id, e)}
                                />
                            </div>

                            <div className='row mt-30'>
                                <label className='d-flex justify-content-end col-lg-2'>Issuing Organization</label>
                                <input
                                    className="col-lg-3 form-control"
                                    type="text"
                                    name="issuing_organization"
                                    value={input.issuing_organization}
                                    onChange={(e) => handleInputChange(input.id, e)}
                                />
                                <label className='d-flex justify-content-end col-lg-2'>Grade</label>
                                <input
                                    className="col-lg-3 form-control"
                                    type="text"
                                    name="grade"
                                    value={input.grade}
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
                            sx={{
                                height: '50%',
                                alignSelf: 'center'
                            }}
                        >
                            Remove Certificate 
                        </Button>
                    </Stack>
                </React.Fragment>
            ))}
        </>
    );
};

export default CertificatesFile;
