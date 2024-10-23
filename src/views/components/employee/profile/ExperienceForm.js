import React from 'react';
import { Button, Stack, Box } from '@mui/material';
import AddIcon from '@mui/icons-material/Add';
import RemoveIcon from '@mui/icons-material/Remove';

const ExperienceForm = ({ inputs = [], handleInputChange, addInputField, removeInputField }) => {
    const handleFileChange = (id, event) => {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = () => {
                handleInputChange(id, {
                    target: {
                        name: 'company_image',
                        value: reader.result
                    }
                });
            };
            reader.readAsDataURL(file);
        }
    };

    return (
        <>
            <div className='row mt-30'>
                <label className='col-lg-8'>Experience</label>
                <Button
                    sx={{ marginBottom: 2 }}
                    variant="contained"
                    className="genric-btn success-border radius col-lg-2"
                    onClick={addInputField}
                >
                    Add Experience
                </Button>
            </div>
            {inputs.map((input, index) => (
                <React.Fragment key={input.id}>
                    <Stack direction="row" spacing={2} alignItems="center" sx={{ marginTop: index === 0 ? '0' : '30px' }}>
                        <Box sx={{ border: '1px solid #ced4da', width: '100%', padding: '20px' }}>
                            <div className='row mt-30'>
                                <label className='d-flex justify-content-end col-lg-2'>Company Image</label>
                                <input
                                    className="col-lg-3 form-control"
                                    type="file"
                                    accept="image/*"
                                    onChange={(e) => handleFileChange(input.id, e)}
                                />
                                {input.company_image && (
                                    <img src={input.company_image} alt="Company" style={{ width: '100px', height: '100px' }} />
                                )}
                                <label className='d-flex justify-content-end col-lg-2'>Company Name</label>
                                <input
                                    className="col-lg-3 form-control"
                                    type="text"
                                    name="company_name"
                                    value={input.company_name}
                                    onChange={(e) => handleInputChange(input.id, e)}
                                />
                            </div>

                            <div className='row mt-30'>
                                <label className='d-flex justify-content-end col-lg-2'>Role of Employee</label>
                                <input
                                    className="col-lg-3 form-control"
                                    type="text"
                                    name="role_of_employee"
                                    value={input.role_of_employee}
                                    onChange={(e) => handleInputChange(input.id, e)}
                                />
                                <label className='d-flex justify-content-end col-lg-2'>Used Technology</label>
                                <input
                                    className="col-lg-3 form-control"
                                    type="text"
                                    name="used_technology"
                                    value={input.used_technology}
                                    onChange={(e) => handleInputChange(input.id, e)}
                                />
                            </div>

                            <div className='row mt-30'>
                                <label className='d-flex justify-content-end col-lg-2'>Working From</label>
                                <input
                                    className="col-lg-3 form-control"
                                    type="date"
                                    name="working_from"
                                    value={input.working_from}
                                    onChange={(e) => handleInputChange(input.id, e)}
                                />
                                <label className='d-flex justify-content-end col-lg-2'>Working To</label>
                                <input
                                    className="col-lg-3 form-control"
                                    type="date"
                                    name="working_to"
                                    value={input.working_to}
                                    onChange={(e) => handleInputChange(input.id, e)}
                                />
                            </div>

                            <div className='row mt-30'>
                                <label className='d-flex justify-content-end col-lg-2'>Location</label>
                                <input
                                    className="col-lg-3 form-control"
                                    type="text"
                                    name="location"
                                    value={input.location}
                                    onChange={(e) => handleInputChange(input.id, e)}
                                />
                                <label className='d-flex justify-content-end col-lg-2'>Responsibilities</label>
                                <input
                                    className="col-lg-3 form-control"
                                    type="text"
                                    name="responsibilities"
                                    value={input.responsibilities}
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
                            Remove Experience 
                        </Button>
                    </Stack>
                </React.Fragment>
            ))}
        </>
    );
};

export default ExperienceForm;
