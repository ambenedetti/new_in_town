const navbar = document.querySelector(".nav");

navbar.addEventListener("scroll", (event) => {
    const arrowRight = document.querySelector(".scroll-right");
    const arrowLeft = document.querySelector(".scroll-left");
    const scrollPosition = event.target.scrolllLeft;

      arrowLeft.classList.add("arrow-active");
      if (event.target.scrollLeft <= 40) {
        arrowLeft.classList.remove("arrow-active");
      } else if (event.target.scrollLeft >= 630) {
        arrowRight.classList.remove("arrow-active");
      } else if (event.target.scrollLeft <= 630){
        arrowRight.classList.add("arrow-active");
      };
});


