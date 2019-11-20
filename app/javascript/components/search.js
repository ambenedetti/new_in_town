import algoliasearch from 'algoliasearch'

const button = document.querySelector(".search-btn");

if (button) {
button.addEventListener("click", (event) => {
  event.preventDefault();
  const searchQuery = document.querySelector(".form-control").value
  console.log(searchQuery)
  search(searchQuery);
});
};


const search = (searchQuery) => {
  var d1 = document.getElementById('testing');
  var client = algoliasearch('AIJNIWQWRP', '36c3e937288c0d983a00bf1b4f4fe435');

  var index = client.initIndex('Tip');
  index.search(searchQuery, { hitsPerPage: 10, page: 0 })
  .then(function searchDone(result) {
    result.hits.forEach((result, index) => {
      const tag = `<div class="card-tip m-3 p-2">
                    <div class="top-card d-flex justify-content-between">
                      <p><strong>${index + 1} | ${result.title}</strong></p>
                    </div>
                    <p class="m-1">${result.content}</p>
                    <div class="bottom-card d-flex justify-content-between">
                      <p>by <strong>${result.user.username}</strong> | about 4 hours ago</p>
                      <a href="/tips/${result.user.id}/reports/new">
                        <i class="far fa-flag"></i>
                      </a>
                      </div>
                  </div>`
      d1.insertAdjacentHTML('beforeend', tag);

    })
  })
  .catch(function searchFailure(err) {
    console.error(err);
  });
}

export { search };





