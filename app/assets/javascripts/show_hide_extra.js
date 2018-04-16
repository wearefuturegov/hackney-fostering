$.fn.showHideExtra = function() {

  if (this.length === 0) { return false; }

  $(this).find('input[value=1]').click(function(){
    $('.extra').removeClass('hidden');
  });

  $(this).find('input[value=0]').click(function(){
    $('.extra').addClass('hidden');
  });

}
