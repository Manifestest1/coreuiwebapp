import React, { useState, useEffect, useParams } from 'react';
import { getFavJob } from '../../../../apiService'; // Import getFavJob function here

const FavouriteJobs = ( ) => {
  const { jobId } = useParams();
  const [favJobs, setFavJobs] = useState([]);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await getFavJob(jobId);
        setFavJobs(response.data.users);
      } catch (error) {
        console.error('Error fetching favorite jobs:', error);
      }
    };

    fetchData();
  }, [jobId]);

  return (
    <div>
      <h2>Favorite Jobs</h2>
      <ul>
        {favJobs.map((job) => (
          <li key={job.id}>{job.title}</li>
        ))}
      </ul>
    </div>
  );
};

export default FavouriteJobs;
