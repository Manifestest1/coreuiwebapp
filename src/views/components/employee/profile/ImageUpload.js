import React, { useState, useRef } from 'react';
import { updateUserProfile } from '../../../../apiService';

const ImageUpload = ({ user, setUser }) => {
    const [imageFile, setImageFile] = useState(null); 
    const [imagePreview, setImagePreview] = useState(null);
    const imageInputRef = useRef(null);
    const baseURL = process.env.REACT_APP_API_URL; 

    const handleImageUpdate = () => {
        if (imageInputRef.current) {
            imageInputRef.current.click();
        }
    };

    const handleImageChange = (e) => {
        const file = e.target.files[0];
        if (file) {
            setImageFile(file);
            const reader = new FileReader();
            reader.onloadend = () => {
                setImagePreview(reader.result);
            };
            reader.readAsDataURL(file);
            updateUserImage(file);
        }
    };

    const updateUserImage = async (file) => {
        try {
            const formData = new FormData();
            formData.append('profile_image', file); 

            const response = await updateUserProfile(formData); 
            setUser(response.data); 
            console.warn('Image updated successfully', response.data);
        } catch (error) {
            console.error('Error updating image', error);
        }
    };

    return (
        <div className="image-upload-container">
            <div className='d-flex justify-content-center position-relative'>
                <input
                    id="image-input"
                    type="file"
                    accept="image/*"
                    onChange={handleImageChange}
                    ref={imageInputRef}
                    style={{ display: 'none' }}
                />
                {imagePreview ? (
                    <img src={imagePreview} alt="Preview" className="img-design" />
                ) : (
                    user?.profile_image ? (
                        <img src={`${baseURL}/uploads/${user.profile_image}`} alt="Profile" className="img-design" />
                    ) : (
                        <img src="/download.png" alt="Default Profile" className="img-design" />
                    )
                )}
                <button className='ca position-absolute bottom-0 end-0' onClick={handleImageUpdate}>
                    <i className="fas fa-camera"></i>
                </button>
            </div>
        </div>
    );
    
};

export default ImageUpload;
