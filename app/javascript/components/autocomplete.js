import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.querySelector('.places-search');
  if (addressInput) {
    places({ container: addressInput });
  }
};

// import algoliasearch from 'algoliasearch'


// const appendInput = () => {
//   const listCity = document.querySelectorAll(".list-city");
//   if (listCity.length == 0){
//     return
//   }
//   listCity.forEach((city) => {
//     city.addEventListener("click", (event) => {
//       const inputTag = `<input id="custId" name="custId" value="${event.target.innerText}">`
//       selected.insertAdjacentHTML("beforeend", inputTag);
//     })
//   })
// }


// const initAutocomplete = () => {
//   const input = document.querySelector('#user_city_name');
//  if (!input) {
//   return
//  }
//   input.addEventListener("keyup", (event) => {
//       fetch("https://places-dsn.algolia.net/1/places/query", {
//         method: "POST",
//         body: JSON.stringify({ query: event.currentTarget.value })
//       })
//         .then(response => response.json())
//         .then((data) => {
//           results.innerHTML = ""
//           data.hits.forEach((data) => {
//             if ( data.is_city) {
//               const tag = `<li class='list-city'>${data.locale_names.default[0]}, ${data.country.default}</li>`
//               results.insertAdjacentHTML("beforeend", tag);
//             }
//           })
//           appendInput()
//         });
//   });

// }

export { initAutocomplete };
