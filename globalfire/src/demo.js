const scroller = new LocomotiveScroll({
    el: document.querySelector("[data-scroll-container]"),
    smooth: true,
});

function navbarChange(){
    const header = document.querySelector("header");
    const navbar = document.querySelector("nav");
    const logo = document.querySelector("#logo");
    let y = header.scrollTop();
    
    if (y > 0){
        header.classList.add("header-flat");
        header.classList.remove("header");

        navbar.classList.add("navbar-flat");
        navbar.classList.remove("navbar");
        
        logo.classList.add("logo-flat");
        logo.classList.remove("logo");
    }
    else if (y <= 10){
        header.classList.add("header");
        header.classList.remove("header-flat");

        navbar.classList.add("navbar");
        navbar.classList.remove("navbar-flat");

        logo.classList.add("logo");
        logo.classList.remove("logo-flat");
    }
}