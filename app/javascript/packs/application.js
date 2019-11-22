import "bootstrap";
import { search } from '../components/search';
import { initAutocomplete } from '../components/autocomplete';
import { initAutocompleteQuestions } from '../components/autocompleteQuestions';

const results = document.querySelector("#results");
const selected = document.querySelector("#selected");
const button = document.querySelector(".search-btn");

initAutocomplete()
initAutocompleteQuestions()
