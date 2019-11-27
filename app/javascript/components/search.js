import algoliasearch from 'algoliasearch'

const button = document.querySelector(".search-btn");

// Find the button
if (button) {
  button.addEventListener("click", (event) => {
    event.preventDefault();
    const searchTip = document.getElementById("query").value;
    const searchCity = document.getElementById("search-result-city").value;
    const searchCountry = document.getElementById("search-result-country").value;
    const searchLat = document.getElementById("search-result-lat").value;
    const searchLng = document.getElementById("search-result-lng").value;
    search({ searchTip, searchCity, searchCountry, searchLng, searchLat });
  });
};

const search = (params = {}) => {
  const client = algoliasearch(process.env.ALGOLIA_APP_ID, process.env.ALGOLIA_SEARCH_KEY);
  const index = client.initIndex('Tip');

  index.search(params.searchTip, {
    hitsPerPage: 20,
    page: 0,
    filters: `country:"${params.searchCountry}"`,
    aroundLatLng: `${params.searchLat}, ${params.searchLng}`,
    aroundRadius: 50000

  }).then(result => {

    const tipIds = result.hits.map(result => result.objectID);
    window.location.replace(`/tips?ids=${tipIds}&search=${params.searchTip}&city=${params.searchCity}&country=${params.searchCountry}&lat=${params.searchLat}&lng=${params.searchLng}`);
  })
  .catch(function searchFailure(err) {
    console.error(err);
  });
}
export { search };
