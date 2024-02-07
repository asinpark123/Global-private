// let scroller = new LocomotiveScroll({
//     el: document.querySelector("[data-scroll-container]"),
//     smooth: true,
// });

function updatePositionY() {
    let headerTop = document.querySelector("header");
    let navbar = document.querySelector("nav");
    let logo = document.querySelector("#logo");
    // let section1 = document.querySelector("#section1");

    if (window.scrollY > 90) {
        headerTop.classList.add("header-flat");
        headerTop.classList.remove("header");

        navbar.classList.add("navbar-flat");
        navbar.classList.remove("navbar");

        logo.classList.add("logo-flat");
        logo.classList.remove("logo");
    } else if (window.scrollY < 90) {
        headerTop.classList.add("header");
        headerTop.classList.remove("header-flat");

        navbar.classList.add("navbar");
        navbar.classList.remove("navbar-flat");

        logo.classList.add("logo");
        logo.classList.remove("logo-flat");
    }
};


window.onscroll = updatePositionY();