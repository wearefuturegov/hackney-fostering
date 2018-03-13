$.fn.deleteAddress = function() {

  if (this.length === 0) { return false; }
    
  $(this).on('submit', function(e) {
    var $table = $('#previous_addresses')
    e.preventDefault();
    this.submit();
    $(this).closest('tr').remove();
    if ($table.find('tbody tr').length == 0) {
      $table.addClass('hidden');
    }
  })
  
}
