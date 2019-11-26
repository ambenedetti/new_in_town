<<<<<<< HEAD
import "bootstrap"
import { search } from '../components/search'
import { initAutocomplete } from '../components/autocomplete'
import { initScroll } from '../components/scrollNavbar'
=======
import "bootstrap";
import { search } from '../components/search';
import { initAutocomplete } from '../components/autocomplete';
import { initAutocompleteQuestions } from '../components/autocompleteQuestions';
import { initAutocompleteTips } from '../components/autocompleteTips';
import { hamburgerMenu } from '../components/navbar';
import { initScroll } from '../components/scrollNavbar';
>>>>>>> origin

const results = document.querySelector("#results");
const selected = document.querySelector("#selected");
const button = document.querySelector(".search-btn");

<<<<<<< HEAD

initAutocomplete();
initScroll();
=======
initAutocomplete();
initScroll();
initAutocompleteQuestions();
initAutocompleteTips();
>>>>>>> origin
