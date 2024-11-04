import React, { useState } from 'react';
import { Button, Stack, Box } from '@mui/material';
import AddIcon from '@mui/icons-material/Add';
import RemoveIcon from '@mui/icons-material/Remove';

const baseURL = process.env.REACT_APP_API_URL;

const DynamicForm = ({ inputs, setInputs, handleInputChange, addInputField, removeInputField, fileInputs, setFileInputs  }) => {
    const [imagePreviews, setImagePreviews] = useState({});
    
    const handleFileChange = (id, event) => {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onloadend = () => {
                setImagePreviews((prev) => ({ ...prev, [id]: reader.result }));
            };
            reader.readAsDataURL(file);
            
            setFileInputs((prevFiles) => ({
                ...prevFiles,
                [id]: file
            }));
            
            setInputs((prevInputs) => 
                prevInputs.map((input) => 
                    input.id === id ? { ...input, company_image: file.name } : input
                )
            );
        }
    };

    return (
        <>
            <label className='mt-30'>Projects</label>
            <div className='row'>
                <label className='col-lg-10 d-flex justify-content-end'>Add New Project</label>
                <Button
                    sx={{ borderRadius: '50%' }}
                    className="genric-btn success-border"
                    variant="contained"
                    startIcon={<AddIcon />}
                    onClick={addInputField}
                />
            </div>
            
            {Array.isArray(inputs) ? (
                inputs.map((input, index) => (
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
                                    <label className='d-flex justify-content-end col-lg-2'>Project Title</label>
                                    <input
                                        className="form-control col-lg-3"
                                        type="text"
                                        name="project_name"
                                        value={input.project_name}
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
                                className="genric-btn success-border"
                                startIcon={<RemoveIcon />}
                                onClick={() => removeInputField(input.id)}
                                sx={{
                                    height: '50%',  
                                    alignSelf: 'center', 
                                    borderRadius: '50%' 
                                }}
                            />
                        </Stack>
                    </React.Fragment>
                ))
            ) : (
                <p>No projects available</p> // Optional: message when inputs is not an array
            )}
        </>
    );
};

export default DynamicForm;
