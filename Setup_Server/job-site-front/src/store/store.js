// In your store configuration file, e.g., store.js
import { configureStore } from '@reduxjs/toolkit';
import favoriteJobsReducer,{ selectFavoriteJobsCount,selectFavoriteJobsList } from './favoriteJobsSlice'; 

const store = configureStore({
  reducer: {
    favoriteJobs: favoriteJobsReducer, 
  },
});

export { selectFavoriteJobsCount,selectFavoriteJobsList };
export default store;