$(document).ready(function() {
  $('#alerts').alerts();

  $('.address_form').getAddress();
  $('.previous_addresses').getAddress();
  $('.referee_form').getAddress();
  $('.delete_address').deleteAddress();
  // $('.application_children_at_home').showHideExtra();
  // $('.application_children_living_elsewhere').showHideExtra();
  // $('.application_adults_living_at_home').showHideExtra();
  // $('.application_adults_living_elsewhere').showHideExtra();
  $('.application_have_pets').showHideExtra();
  $('header .menu_btn').menuToggle();

  $('.disabled a').click(function(e) {
    console.log('test');
    e.preventDefault();
  });
});
