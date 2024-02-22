window.onload = (event) => {
	detectTouchOnLoad();
	// TeamListY = document.querySelector(".teamSection").offsetHeight;
	AboutUsY = document.getElementById("AboutUs").offsetTop;
	ServicesY = document.getElementById("Services").offsetTop;
	PassiveProY = document.getElementById("PassivePro").offsetTop;
	ProjectsY = document.getElementById("Projects").offsetTop;
	TeamY = document.getElementById("Team").offsetTop;
	GroupY = document.getElementById("Group").offsetTop;
	ContactY = document.getElementById("Contact").offsetTop;
};
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
}

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
}

let services = document.getElementsByClassName("services");
let servicesSection = document.getElementById("Services");
for (let i = 0; i < services.length; i++) {
	services[i].addEventListener("mouseenter", function () {
		services[i].style.opacity = 1;
		services[i].style.pointerEvents = "none";
		services[i].style.transitionDelay = "0.0s";
		services[i].style.transition = "0.0s";
	});
	services[i].addEventListener("mouseleave", function () {
		services[i].style.opacity = 0.4;
		services[i].style.pointerEvents = "auto";
		services[i].style.transitionDelay = "0.2s";
		services[i].style.transition = "2s";
	});
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

for (let i = 0; i < items.length; i++) {
	items[i].addEventListener("mouseenter", function () {
		items[i].style.opacity = 1;
		items[i].style.pointerEvents = "none";
		items[i].style.transitionDelay = "0.0s";
		items[i].style.transition = "0.0s";
	});
	items[i].addEventListener("mouseleave", function () {
		items[i].style.opacity = 0.8;
		items[i].style.pointerEvents = "auto";
		items[i].style.transitionDelay = "0.2s";
		items[i].style.transition = "5s";
	});
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
	let carouselImages = document.querySelectorAll(
		".owl-carousel .imgWindow img"
	);
	// let glImage = document.querySelectorAll(".glInfo .imageContainer img");
	new simpleParallax(carouselImages, {
		scale: 1.3,
	});
	// new simpleParallax(glImage, {
	//     scale: 1.3,
	// });
});

// Magnific Popup
$(document).ready(function () {
	let popup = $(".popup-container");
	popup.magnificPopup({
		delegate: "a",
		type: "image",
		gallery: { enabled: true },
		image: {
			titleSrc: "title",
			verticalFit: true,
			tError: '<a href="%url%">The image</a> could not be loaded.',
		},
		mainClass: "mfp-with-zoom", // this class is for CSS animation below
		zoom: {
			enabled: true, // By default it's false, so don't forget to enable it
			duration: 300, // duration of the effect, in milliseconds
			easing: "ease-in-out", // CSS transition easing function
			opener: function (openerElement) {
				return openerElement.is("img")
					? openerElement
					: openerElement.find("img");
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
	AOS.refresh();
}
document.getElementById("defaultOpen").click();

// AOS
// fetch People JSON
let teamData, i, j, photoSrc, staffName, jobTitle, title;
fetch("./people.json")
	.then((response) => response.json())
	.then((json) => {
		teamData = json;
		for (i = 0; i < teamData.length; i++) {
			title = teamData[i].team;
			const $jobCategory = $('<div class="jobCategoryContainer"></div>');
			const $jobCategoryTitle = $(`<h4 class="jobCategory">${title}</h4>`);
			const $staffContainer = $('<div class="staffContainer"></div>');
			for (j = 0; j < teamData[i].list.length; j++) {
				const $staff = $(
					`<div class="staff" data-aos="fade-right" data-aos-delay="${
						(j / i) * 200
					}"></div>`
				);
				$staffContainer.append($staff);
				photoSrc = teamData[i].list[j].photo;
				staffName = teamData[i].list[j].name;
				jobTitle = teamData[i].list[j].duty;
				const $staffPhoto = $(
					`<div class=imageContainer><img src="${photoSrc}" alt="${staffName}"></div>`
				);
				const $staffInfo = $('<div class="staffInfo"></div>');
				$staffPhoto.append($staffInfo);
				$staff.append($staffPhoto);
				const $staffName = $(`<div class="name">${staffName}</div>`);
				const $staffJobTitle = $(
					`<div class="jobTitle"><i>${jobTitle}</i></div>`
				);
				$staffInfo.append($staffName, $staffJobTitle);
			}
			$jobCategory.append($jobCategoryTitle, $staffContainer);
			$(".tabContent").append($jobCategory);
		}
		AOS.init();
	});

menu = document.getElementById("navbar");
hamburgerButton = document.querySelector(".hamburger");
closeButton = document.querySelector(".hamburgerClose img");
function hamburgerMenuOpen() {
	menu.classList.add("mobile");
	closeButton.classList.add("active");
	hamburgerButton.classList.add("active");
}
function hamburgerMenuClose() {
	menu.classList.remove("mobile");
	closeButton.classList.remove("active");
	hamburgerButton.classList.remove("active");
}

function isTouchDevice() {
	return (
		"ontouchstart" in window ||
		navigator.maxTouchPoints > 0 ||
		navigator.msMaxTouchPoints > 0
	);
}
let touchDetection;
let sectionTag;
function detectTouchOnLoad() {
	touchDetection = isTouchDevice();
	sectionTag = document.getElementsByTagName("section");
	let i, j, k;
	let projectTitle = document.querySelectorAll(".owl-carousel p");
	if (touchDetection) {
		console.log("is touch device");
		canvas.style.zIndex = -1;
		for (i = 0; i < services.length; i++) {
			services[i].classList.add("touch");
		}
		for (j = 0; j < items.length; j++) {
			items[j].classList.add("touch");
		}
		for (k = 0; k < sectionTag.length; k++) {
			sectionTag[k].classList.add("touch");
		}
	} else {
		console.log("is NOT touch device");
	}
}

let yPosition = () => window.scrollY;
let yOffset;

let AboutUsY;
let ServicesY;
let PassiveProY;
let ProjectsY;
let TeamY;
let GroupY;
let ContactY;
// let TeamListY;
let detectionPadding = 250;

let navMenus = document.querySelectorAll(".navMenu");
function sectionTracker() {
	yOffset = yPosition() + detectionPadding;
	let i;
	if (yOffset > 0 && yOffset < AboutUsY) {
		navMenus[0].classList.add("current");
		for (i = 0; i < navMenus.length; i++) {
			if (i == 0) {
				continue;
			}
			navMenus[i].classList.remove("current");
		}
	} else if (yOffset > AboutUsY && yOffset < ServicesY) {
		navMenus[1].classList.add("current");
		for (i = 0; i < navMenus.length; i++) {
			if (i == 1) {
				continue;
			}
			navMenus[i].classList.remove("current");
		}
	} else if (yOffset > ServicesY && yOffset < PassiveProY) {
		navMenus[2].classList.add("current");
		for (i = 0; i < navMenus.length; i++) {
			if (i == 2) {
				continue;
			}
			navMenus[i].classList.remove("current");
		}
	} else if (yOffset > PassiveProY && yOffset < ProjectsY) {
		navMenus[3].classList.add("current");
		for (i = 0; i < navMenus.length; i++) {
			if (i == 3) {
				continue;
			}
			navMenus[i].classList.remove("current");
		}
	} else if (yOffset > ProjectsY && yOffset < TeamY) {
		navMenus[4].classList.add("current");
		for (i = 0; i < navMenus.length; i++) {
			if (i == 4) {
				continue;
			}
			navMenus[i].classList.remove("current");
		}
	} else if (yOffset > TeamY && yOffset < GroupY) {
		navMenus[5].classList.add("current");
		for (i = 0; i < navMenus.length; i++) {
			if (i == 5) {
				continue;
			}
			navMenus[i].classList.remove("current");
		}
	} else if (yOffset > GroupY && yOffset < ContactY) {
		navMenus[6].classList.add("current");
		for (i = 0; i < navMenus.length; i++) {
			if (i == 6) {
				continue;
			}
			navMenus[i].classList.remove("current");
		}
	} else if (yOffset > ContactY) {
		navMenus[7].classList.add("current");
		for (i = 0; i < navMenus.length; i++) {
			if (i == 7) {
				continue;
			}
			navMenus[i].classList.remove("current");
		}
	}
}


function resizeOnScroll(){
	let ppVideo = document.querySelector(".passivePro video");
	let PassivePro = document.getElementById("PassivePro")
	// let PassiveProStart = PassivePro.offsetTop;
	// let PassiveProHeight = PassivePro.offsetHeight;
	// let ppCurrentScroll = scrollY - PassiveProStart;
	let PassiveProEnd = PassivePro.offsetTop + PassivePro.offsetHeight;
	let insetRatioX = (-scrollY * 100) / PassiveProEnd + 75;
	// console.log(percentToEnd);
	if (yOffset+500 > PassiveProY && yOffset < ProjectsY) {
		ppVideo.style.clipPath = `inset(0 ${insetRatioX}% 0)`;
	}
	else{
		ppVideo.style.clipPath = `inset(0 50% 0)`;
	}
}