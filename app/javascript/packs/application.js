import { search } from '../components/search';
import { initAutocomplete } from '../components/autocomplete';
import { hamburgerMenu } from '../components/navbar';
import { initScroll } from '../components/scrollNavbar';


const results = document.querySelector("#results");
const selected = document.querySelector("#selected");
const button = document.querySelector(".search-btn");

initAutocomplete();
initScroll();

