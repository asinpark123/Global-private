const scroller = new LocomotiveScroll({
    el: document.querySelector("[data-scroll-container]"),
    smooth: true,
});

function navbarChange(){
    const header = document.querySelector("header");
    const navbar = document.querySelector("nav");
    let y = header.scrollTop();
    
    if (y > 0){
        header.classList.add("header-flat");
        header.classList.remove("header");

        navbar.classList.add("navbar-flat");
        navbar.classList.remove("navbar");
    }
    else if (y <= 10){
        header.classList.add("header");
        header.classList.remove("header-flat");

        navbar.classList.add("navbar");
        navbar.classList.remove("navbar-flat");
}
}