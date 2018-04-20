$.fn.showHideExtra = function() {

  if (this.length === 0) { return false; }

  $(this).find('input[type=radio]').change(function(){
    if ($(this).val() == "true") {
      $('.extra').show();
    } else {
      $('.extra').hide();
    }
  });

}
