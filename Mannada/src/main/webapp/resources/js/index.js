/**
 * 
 */

var swiper = new Swiper(".mySwiper", {
    slidesPerView: 1,
    spaceBetween: 30,
    loop: true,
    autoplay: {
         delay: 5000,
    },
    pagination: {
      el: ".swiper-pagination",
      clickable: true,
    },
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
  });

  
const rankings = document.querySelectorAll('.ranking');
rankings.forEach(function(element) {
  const count = element.textContent.trim();
  if (count == '1' || count == '2' || count == '3') {
    element.style.color = '#de2f00';
  }
});