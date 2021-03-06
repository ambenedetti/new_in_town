import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.querySelector('.places-search');
  if (addressInput) {
    const placesAutocomplete = places({ container: addressInput }).configure({
      type: 'city',
      aroundLatLngViaIP: true,
      language: 'en'
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

    });

    placesAutocomplete.on('change', e => {
      const button = document.getElementById('home-search-button');
      if (!button) {
        return;
      }
      const afterCitySelection = document.getElementById('after-city-selection');
      button.removeAttribute('disabled');
      button.classList.remove('disabled');
      afterCitySelection.classList.remove("hidden-before-city");
    });

    placesAutocomplete.on('clear', e => {
      const button = document.getElementById('home-search-button');
      if (!button) {
        return;
      }
      const afterCitySelection = document.getElementById('after-city-selection');
      button.setAttribute('disabled', true);
      button.classList.add('disabled');
      afterCitySelection.classList.add("hidden-before-city");
    });
  }
};

export { initAutocomplete };
