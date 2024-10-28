import React, { useState } from 'react';
import { Button, Stack, Box } from '@mui/material';
import AddIcon from '@mui/icons-material/Add';
import RemoveIcon from '@mui/icons-material/Remove';

const baseURL = process.env.REACT_APP_API_URL;

const ExperienceForm = ({ inputs, setInputs, handleInputChange, addInputField, removeInputField }) => {
    const [imagePreviews, setImagePreviews] = useState({});

    const handleFileChange = (id, event) => {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onloadend = () => {
                setImagePreviews((prev) => ({ ...prev, [id]: reader.result }));
            };
            reader.readAsDataURL(file);
            
            setInputs((prevInputs) => 
                prevInputs.map((input) => 
                    input.id === id ? { ...input, company_image: file.name } : input
                )
            );
        }
    };

    return (
        <>
            <label className='mt-30'>Experience</label>
            <div className='row'>
                <label className='col-lg-10 d-flex justify-content-end'>Add New Experience</label>
                <Button
                    sx={{ borderRadius: '50%' }}
                    variant="contained"
                    startIcon={<AddIcon />}
                    className="genric-btn success-border"
                    onClick={addInputField}
                >
                </Button>
            </div>
            {inputs.map((input, index) => (
                <React.Fragment key={input.id}>
                    <Stack direction="row" spacing={2} alignItems="center" sx={{ marginTop: index === 0 ? '0' : '30px' }}>
                        <Box sx={{ border: '1px solid #ced4da', width: '83%', padding: '20px' }}>
                            <div className='row mt-30'>
                                <label className='d-flex justify-content-end col-lg-2'>Company Image</label>
                                <input
                                        className="form-control col-lg-3"  
                                        type="file" 
                                        accept="image/*"  
                                        name="company_image"
                                        onChange={(e) => handleFileChange(input.id, e)}
                                    />
                                    {input.company_image && (
                                        imagePreviews[input.id] ? (
                                            <img src={imagePreviews[input.id]} alt="Preview" className="img-design" style={{ width: '50px', height: '50px' }} />
                                        ) : (
                                            <img src={`${baseURL}/uploads/${input.company_image}`} alt="" style={{ width: '50px', height: '50px' }} />
                                        )
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
                            className="genric-btn success-border"
                            startIcon={<RemoveIcon />}
                            onClick={() => removeInputField(input.id)}
                            sx={{
                                height: '50%',
                                alignSelf: 'center',
                                borderRadius: '50%'
                            }}
                        > 
                        </Button>
                    </Stack>
                </React.Fragment>
            ))}
        </>
    );
};

export default ExperienceForm;
