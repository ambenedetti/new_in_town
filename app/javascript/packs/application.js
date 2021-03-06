import "bootstrap"
import { search } from '../components/search'
import { initAutocomplete } from '../components/autocomplete'
import { initScroll } from '../components/scrollNavbar'
import { hamburgerMenu } from '../components/navbar'
import { countContentChars } from '../components/counter';

const results = document.querySelector("#results");
const selected = document.querySelector("#selected");
const button = document.querySelector(".search-btn");

initScroll();
initAutocomplete();
hamburgerMenu();
countContentChars();


