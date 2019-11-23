import places from 'places.js';

const initAutocompleteTips = () => {
  const addressInput = document.getElementById('tip_city');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocompleteTips };
