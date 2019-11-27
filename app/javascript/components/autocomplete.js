import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.querySelector('.places-search');
  if (addressInput) {
    const placesAutocomplete = places({ container: addressInput }).configure({
      type: 'city',
      aroundLatLngViaIP: true,
      language: 'en'
    });

    placesAutocomplete.on('clear', e => {
      const button = document.getElementById('home-search-button');
      button.setAttribute('disabled', true);
      button.classList.add('disabled');
    });

    placesAutocomplete.on('change', e => {
      const selected = e.suggestion

      const cityField = document.getElementById("search-result-city");
      cityField.value = selected.name;

      const countryField = document.getElementById("search-result-country");
      countryField.value = selected.country;

      const latField = document.getElementById("search-result-lat");
      latField.value = selected.latlng.lat;

      const lngField = document.getElementById("search-result-lng");
      lngField.value = selected.latlng.lng;

      const button = document.getElementById('home-search-button');
      button.removeAttribute('disabled');
      button.classList.remove('disabled');
    });
  }
};

export { initAutocomplete };
