import algoliasearch from 'algoliasearch'

const button = document.querySelector(".search-btn");

if (button) {
  button.addEventListener("click", (event) => {
    event.preventDefault();
    const searchQuery = document.querySelector(".form-control").value
    search(searchQuery);
  });
};

const search = (searchQuery) => {
  const client = algoliasearch('AIJNIWQWRP', '36c3e937288c0d983a00bf1b4f4fe435');

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





