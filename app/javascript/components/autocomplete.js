import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.querySelector('.places-search');
  if (addressInput) {
    const placesAutocomplete = places({ container: addressInput }).configure({
      type: 'city',
      aroundLatLngViaIP: true
    });

    placesAutocomplete.on('change', e => {
      const selected = e.suggestion

      console.log(selected);

      const cityField = document.getElementById("search-result-city");
      cityField.value = selected.name;

      const countryField = document.getElementById("search-result-country");
      countryField.value = selected.country;

      const latField = document.getElementById("search-result-lat");
      latField.value = selected.latlng.lat;

      const lngField = document.getElementById("search-result-lng");
      lngField.value = selected.latlng.lng;

    });
  }
};

export { initAutocomplete };
