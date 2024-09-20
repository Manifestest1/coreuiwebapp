import React, { useEffect, useState } from 'react';
import { useLocation } from 'react-router-dom';
import { Helmet } from 'react-helmet';
import axios from 'axios';

const MetaDataForm = () => {
  const [metaData, setMetaData] = useState({
    title: 'Loading...', // Use a loading title or a more neutral title
    description: 'Loading...',
    keywords: 'loading'
  });
  const [allPages, setAllPages] = useState([]);
  const [loading, setLoading] = useState(true);
  const location = useLocation();

  useEffect(() => {
    const fetchMetaData = async () => {
      try {
        const response = await axios.get('http://localhost:8000/api/admin/meta-tags');
        if (response.data) {
          setAllPages(response.data);
        }
      } catch (error) {
        console.error('Error fetching meta tag details:', error);
      } finally {
        setLoading(false);
      }
    };

    fetchMetaData();
  }, []);

  useEffect(() => {
    const currentPath = location.pathname.replace(/^\/+/, '');
    const currentPageMeta = allPages.find(page => `/${page.url}` === location.pathname);

    if (currentPageMeta) {
      setMetaData({
        title: currentPageMeta.title,
        description: currentPageMeta.description,
        keywords: currentPageMeta.keywords
      });
    } else if (!loading) {
      // Set default metadata only if not loading
      setMetaData({
        title: 'Manifest Job Site',
        description: 'Default Description',
        keywords: 'default, keywords'
      });
    }
  }, [location.pathname, allPages, loading]);

  return (
    <Helmet>
      <title>{metaData.title}</title>
      <meta name="description" content={metaData.description} />
      <meta name="keywords" content={metaData.keywords} />
    </Helmet>
  );
};

export default MetaDataForm;
