const hambContainer = document.querySelector('.hamburger-container')

const hamburgerMenu = () => {
  if (!hambContainer) {
    return;
  }

  hambContainer.addEventListener("click", () => {
    const hamburgerBars = document.querySelectorAll(".bar")
    hamburgerBars.forEach(bar => {
      bar.classList.toggle("change");
    });
  });
}

export { hamburgerMenu };
