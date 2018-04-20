$(document).ready(function() {
  $('#alerts').alerts();

  $('.address_form').getAddress();
  $('.previous_addresses').getAddress();
  $('.referee_form').getAddress();
  $('.delete_address').deleteAddress();
  $('.application_have_pets').showHideExtra();
  $('header .menu_btn').menuToggle();
  $('.accordion').each(function() { $(this).accordion() });

  $('.disabled a').click(function(e) {
    e.preventDefault();
  });
});
