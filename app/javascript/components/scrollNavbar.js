const navbar = document.querySelector(".nav");

const initScroll = () => {
   if (!navbar) {
    return;
  }

  navbar.addEventListener("scroll", (event) => {

      const arrowRight = document.querySelector(".scroll-right");
      const arrowLeft = document.querySelector(".scroll-left");
      const scrollPosition = event.target.scrolllLeft;

        if (event.target.scrollLeft <= 40) {
          arrowLeft.classList.remove("arrow-active");
        } else if (event.target.scrollLeft >= 630) {
          arrowRight.classList.remove("arrow-active");
        } else if (event.target.scrollLeft <= 630){
          arrowLeft.classList.add("arrow-active");
          arrowRight.classList.add("arrow-active");
        };
  });
}

export { initScroll }

