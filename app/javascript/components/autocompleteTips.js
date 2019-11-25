import places from 'places.js';

const initAutocompleteTips = () => {
  const addressTipInput = document.getElementById('tip_city');
  if (addressTipInput) {
    places({ container: addressTipInput });
  }
};

export { initAutocompleteTips };
