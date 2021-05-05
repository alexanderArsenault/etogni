/**
 * Application entry point
 */

// Load application styles
import 'scss/_index.scss';
import * as $ from 'jquery'


// ================================
// START YOUR APP HERE
// ================================

const $menuBtn = document.querySelector(".menu");
const $nav = document.querySelector(".mobile-navigation")
$menuBtn.addEventListener("click", () => {
	$menuBtn.classList.toggle('opened');
	$nav.classList.toggle('opened')
	$menuBtn.setAttribute('aria-expanded', $menuBtn.classList.contains('opened'))
});


const $navlinks = document.getElementsByClassName("mobile-navigation-link")

for (var i = 0; i < $navlinks.length; i++){
	$navlinks[i].addEventListener("click", () => {
		$menuBtn.classList.toggle('opened');
		$nav.classList.toggle('opened')
		$menuBtn.setAttribute('aria-expanded', $menuBtn.classList.contains('opened'))
	});
}

const headerHeight = 104;

$("a").on('click', function(event) {
	// Make sure this.hash has a value before overriding default behavior
	if (this.hash !== "") {
		// Prevent default anchor click behavior
		event.preventDefault();

		// Store hash
		var hash = this.hash;

		// Using jQuery's animate() method to add smooth page scroll
		// The optional number (800) specifies the number of milliseconds it takes to scroll to the specified area
		$('html, body').animate({
			scrollTop: $(hash).offset().top - headerHeight
		}, 400, function(){
			history.pushState({}, '', hash)
		});
	} // End if
});

$('#top-button').on('click', function(event){
	$('html, body').animate({
		scrollTop: $('body').offset().top
	}, 400, function(){
		history.pushState({}, '', '')
	});
})

