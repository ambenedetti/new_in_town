import algoliasearch from 'algoliasearch'



const button = document.querySelector(".search-btn");

// Find the button
if (button) {
  button.addEventListener("click", (event) => {
    event.preventDefault();
    const searchTip = document.getElementById("query").value
    const searchCity = document.getElementById("query-city").value
    const searchQuery = `${searchTip} ${searchCity}`
    search(searchQuery);
  });
};
const search = (searchQuery) => {
  const client = algoliasearch(process.env.ALGOLIA_APP_ID, process.env.ALGOLIA_SEARCH_KEY);
  const index = client.initIndex('Tip');
  index.search(searchQuery, { hitsPerPage: 20, page: 0 })
  .then(result => {
    const tipIds = result.hits.map(result => result.objectID);
    window.location.replace(`/tips?ids=${tipIds}&search=${searchQuery}`);
  })
  .catch(function searchFailure(err) {
    console.error(err);
  });
}
export { search };
