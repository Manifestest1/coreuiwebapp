// In your reducers folder, e.g., favoriteJobsSlice.js
import { createSlice } from '@reduxjs/toolkit';

export const favoriteJobsSlice = createSlice({  
  name: 'favoriteJobs',
  initialState: {
    favoriteJobsCount: 0,
    favoriteJobsList: [],
  },
  reducers: {
    setFavoriteJobsCount: (state, action) => {
      state.favoriteJobsCount = action.payload;
    },
    addFavoriteJob: (state, action) => {
      state.favoriteJobsList.push(action.payload);
      state.favoriteJobsCount = state.favoriteJobsList.length;
    },
    removeFavoriteJob: (state, action) => {
      state.favoriteJobsList = state.favoriteJobsList.filter(job => job.id !== action.payload.id);
      state.favoriteJobsCount = state.favoriteJobsList.length;
    },
  },
});

export const { setFavoriteJobsCount,addFavoriteJob,removeFavoriteJob } = favoriteJobsSlice.actions;

export const selectFavoriteJobsCount = state => state.favoriteJobs.favoriteJobsCount;
export const selectFavoriteJobsList = state => state.favoriteJobs.favoriteJobsList;

export default favoriteJobsSlice.reducer;