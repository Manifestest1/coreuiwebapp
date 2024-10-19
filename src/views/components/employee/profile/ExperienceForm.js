import React from 'react';
import { Button, Stack, Box } from '@mui/material';
import AddIcon from '@mui/icons-material/Add';
import RemoveIcon from '@mui/icons-material/Remove';

const ExperienceForm = ({ inputs = [], handleInputChange, addInputField, removeInputField }) => {
    const handleFileChange = (id, event) => {
        const file = event.target.files[0];
        if (file) {
            // Create a URL for the uploaded image file
            const reader = new FileReader();
            reader.onload = () => {
                handleInputChange(id, {
                    target: {
                        name: 'company_image',
                        value: reader.result // Use the base64 data URL as the image source
                    }
                });
            };
            reader.readAsDataURL(file); // Convert the file to base64 URL
        }
    };

    return (
        <Box sx={{ padding: 2 }}>
            {inputs.map((input, index) => (
                <Stack key={input.id} spacing={2} direction="column" alignItems="center">
                    <div className="row">
                        <div className="col-lg-2">
                            <label className="mt-30">Company Image</label>
                        </div>
                        <div className="col-lg-4">
                            <input
                                className="mt-30 form-control"
                                type="file"
                                accept="image/*"
                                onChange={(e) => handleFileChange(input.id, e)}
                                variant="outlined"
                            />
                            {input.company_image && (
                                <img src={input.company_image} alt="Company" style={{ width: '100px', height: '100px' }} />
                            )}
                        </div>


                        {/* Other input fields */}
                        <div className="col-lg-2">
                            <label className="mt-30">Company Name</label>
                        </div>
                        <div className="col-lg-4">
                            <input
                                className="mt-30 form-control"
                                type="text"
                                name="company_name"
                                value={input.company_name}
                                onChange={(e) => handleInputChange(input.id, e)}
                                variant="outlined"
                            />
                        </div>

                        <div className="col-lg-2">
                            <label className="mt-30">Role of Employee</label>
                        </div>
                        <div className="col-lg-4">
                            <input
                                className="mt-30 form-control"
                                type="text"
                                name="role_of_employee"
                                value={input.role_of_employee}
                                onChange={(e) => handleInputChange(input.id, e)}
                                variant="outlined"
                            />
                        </div>

                        <div className="col-lg-2">
                            <label className="mt-30">Used Technology</label>
                        </div>
                        <div className="col-lg-4">
                            <input
                                className="mt-30 form-control"
                                type="text"
                                name="used_technology"
                                value={input.used_technology}
                                onChange={(e) => handleInputChange(input.id, e)}
                                variant="outlined"
                            />
                        </div>

                        <div className="col-lg-2">
                            <label className="mt-30">Working From</label>
                        </div>
                        <div className="col-lg-4">
                            <input
                                className="mt-30 form-control"
                                type="date"
                                name="working_from"
                                value={input.working_from}
                                onChange={(e) => handleInputChange(input.id, e)}
                                variant="outlined"
                            />
                        </div>

                        <div className="col-lg-2">
                            <label className="mt-30">Working To</label>
                        </div>
                        <div className="col-lg-4">
                            <input
                                className="mt-30 form-control"
                                type="date"
                                name="working_to"
                                value={input.working_to}
                                onChange={(e) => handleInputChange(input.id, e)}
                                variant="outlined"
                            />
                        </div>

                        <div className="col-lg-2">
                            <label className="mt-30">Location</label>
                        </div>
                        <div className="col-lg-4">
                            <input
                                className="mt-30 form-control"
                                type="text"
                                name="location"
                                value={input.location}
                                onChange={(e) => handleInputChange(input.id, e)}
                                variant="outlined"
                            />
                        </div>

                        <div className="col-lg-2">
                            <label className="mt-30">Responsibilities</label>
                        </div>
                        <div className="col-lg-4">
                            <input
                                className="mt-30 form-control"
                                type="text"
                                name="responsibilities"
                                value={input.responsibilities}
                                onChange={(e) => handleInputChange(input.id, e)}
                                variant="outlined"
                            />
                        </div>
                    </div>

                    <Stack direction="row" spacing={2} alignItems="center">
                        <Button
                            variant="contained"
                            className="genric-btn success-border radius"
                            onClick={() => removeInputField(input.id)}
                            startIcon={<RemoveIcon />}
                        >
                            Remove Experience
                        </Button>
                    </Stack>
                </Stack>
            ))}

            {/* Add Experience Button */}
            <Stack direction="row" spacing={2} alignItems="center" justifyContent="center" sx={{ marginTop: 2 }}>
                <Button
                    variant="contained"
                    className="genric-btn success-border radius"
                    onClick={addInputField}
                    startIcon={<AddIcon />}
                >
                    Add Experience
                </Button>
            </Stack>
        </Box>
    );
};

export default ExperienceForm;
