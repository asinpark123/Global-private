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
        $(".headerBG-fade").fadeOut(500);
    } else if (window.scrollY > 100) {
        $(".headerBG-fade").fadeIn(500);
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

let items = document.querySelectorAll(".owl-carousel .item");
for(let i = 0; i < items.length; i++){
    items[i].addEventListener('mouseenter', function(){
        items[i].style.opacity = 1;
        items[i].style.pointerEvents = "none";
        items[i].style.transitionDelay= '0.0s';
        items[i].style.transition = "0.0s";
    })
    items[i].addEventListener('mouseleave', function(){
        items[i].style.opacity = 0.8;
        items[i].style.pointerEvents = "auto";
        items[i].style.transitionDelay = "0.2s";
        items[i].style.transition = "5s";
    })
}

// Owl Carousel 2
$(document).ready(function () {
    let owl = $(".owl-carousel");
    owl.owlCarousel({
        // stagePadding: 50,
        loop: true,
        center: true,
        margin: 10,
        autoWidth: true,
        autoplay: true,
        autoplayTimeout: 5000,
        autoplaySpeed: 1000,
        // autoplayHoverPause: true,
    });
});

// simpleParallax 5.6.2
$(document).ready(function () {
    let carouselImages = document.querySelectorAll(".owl-carousel .imgWindow img");
    new simpleParallax(carouselImages,{
        scale: 1.3
    });
});

// Magnific Popup
$(document).ready(function () {
    let popup = $(".popup-container")
    popup.magnificPopup({
        delegate: "a",
        type: "image",
        gallery: { enabled: true },
        image: {
            titleSrc: 'title',
            verticalFit: true,
            tError: '<a href="%url%">The image</a> could not be loaded.',
        },
        mainClass: "mfp-with-zoom", // this class is for CSS animation below
        zoom: {
            enabled: true, // By default it's false, so don't forget to enable it
            duration: 300, // duration of the effect, in milliseconds
            easing: "ease-in-out", // CSS transition easing function
            opener: function (openerElement) {
                return openerElement.is("img") ? openerElement : openerElement.find("img");
            },
        },
    });
});

// Teams Tab
function openTab(evt, cityName) {
	let i, tabContent, tabLinks;
	tabContent = document.getElementsByClassName("tabContent");
	for (i = 0; i < tabContent.length; i++) {
		tabContent[i].style.display = "none";
	}
	tabLinks = document.getElementsByClassName("tabLinks");
	for (i = 0; i < tabLinks.length; i++) {
		tabLinks[i].className = tabLinks[i].className.replace(" active", "");
	}
	document.getElementById(cityName).style.display = "block";
	evt.currentTarget.className += " active";
}
document.getElementById("defaultOpen").click();

// fetch People JSON
let teamData
fetch("./people.json")
	.then((response) => response.json())
	.then((json) => {
        teamData = json; 
        for(let i = 0;i<teamData.length;i++){
            const $jobCategory = $('<div class="jobCategoryContainer"></div>');
            const $jobCategoryTitle = $(`<h4 class="jobCategory">${teamData[i].team}</h4>`);
            const $staffContainer = $('<div class="staffContainer"></div>');
            for(let j = 0; j<teamData[i].list.length;j++){
                const $staff = $('<div class="staff"></div>');
                $staffContainer.append($staff);
                let photoSrc = teamData[i].list[j].photo;
                let staffName = teamData[i].list[j].name;
                let jobTitle = teamData[i].list[j].duty;
                const $staffPhoto = $(`<img src="${photoSrc}" alt="${staffName}">`);
                const $staffInfo = $('<div class="staffInfo"></div>');
                $staff.append($staffPhoto, $staffInfo);
                const $staffName = $(`<div class="name">${staffName}</div>`);
                const $staffJobTitle = $(`<div class="jobTitle">${jobTitle}</div>`);
                $staffInfo.append($staffName,$staffJobTitle)
            }
            $jobCategory.append($jobCategoryTitle, $staffContainer);
            $(".tabContent").append($jobCategory);
        }
    });