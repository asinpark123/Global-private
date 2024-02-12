function navbarChange() {
    let headerTop = document.querySelector("header");
    let navbar = document.querySelector("nav");
    let logo = document.querySelector("#logo");

    if (window.scrollY > 200) {
        headerTop.classList.add("header-flat");
        headerTop.classList.remove("header");

        navbar.classList.add("navbar-flat");
        navbar.classList.remove("navbar");

        logo.classList.add("logo-flat");
        logo.classList.remove("logo");
    } else if (window.scrollY < 200) {
        headerTop.classList.add("header");
        headerTop.classList.remove("header-flat");

        navbar.classList.add("navbar");
        navbar.classList.remove("navbar-flat");

        logo.classList.add("logo");
        logo.classList.remove("logo-flat");
    }
};

// function navbarBGActivate() {
//     let headerFlat = document.querySelector(".header-flat")
//     if (window.scrollY < 200) {
//         headerFlat.style.backgroundImage = "none";
//     } else if (window.scrollY > 200) {
//         headerFlat.style.backgroundImage = "linear-gradient(black, rgb(20,20,20), transparent";
//     } 
// };

function headerBGfade() {
    if (window.scrollY < 100) {
        $(".headerBG-fade").fadeOut();
    } else if (window.scrollY > 100) {
        $(".headerBG-fade").fadeIn();
    } 
};

let services = document.getElementsByClassName("services");
let servicesSection = document.getElementById("Services");
for(let i = 0; i < services.length; i++){
    services[i].addEventListener('mouseenter', function(){
        services[i].style.opacity = 1;
        services[i].style.pointerEvents = "none";
        services[i].style.transitionDelay= '0.0s';
        services[i].style.transition = "0.0s";
    })
    services[i].addEventListener('mouseleave', function(){
        services[i].style.opacity = 0.4;
        services[i].style.pointerEvents = "auto";
        services[i].style.transitionDelay = "0.2s";
        services[i].style.transition = "2s";
    })
    servicesSection.addEventListener("mouseenter", function () {
      services[i].style.opacity = 0.4;
      services[i].style.pointerEvents = "auto";
      services[i].style.transitionDelay = "0.2s";
      services[i].style.transition = "2s";
    });
}

// let scroller = new LocomotiveScroll({
//     el: document.querySelector("[data-scroll-container]"),
//     smooth: true,
// });
