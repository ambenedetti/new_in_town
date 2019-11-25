const hambContainer = document.querySelector('.hamburger-container')

const hamburgerMenu = () => {
  const hamburgerBars = document.querySelectorAll(".bar")
  hamburgerBars.forEach((bar) => {
    bar.classList.toggle("change");
  })
}

hambContainer.addEventListener("click", hamburgerMenu);

export { hamburgerMenu };
