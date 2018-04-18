$.fn.menuToggle = function() {

  if (this.length === 0) { return false; }

  $(this).click(function() {
    $(this).toggleClass('active');
    $('.side_nav').slideToggle();
  });

}
