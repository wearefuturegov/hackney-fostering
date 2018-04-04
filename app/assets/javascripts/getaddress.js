$.fn.getAddress = function() {

  if (this.length === 0) { return false; }
    
  var apiKey = $(this).data('api-key');
  var baseUrl = 'https://api.ideal-postcodes.co.uk/v1/postcodes/'
  var $addressSelect = $(this).find('select.addresses');
  var $postcodeInput = $(this).find('#postcode_search')
  var $yourPostcode = $(this).find('#your_postcode');
  var $findAddress = $(this).find('#find_address');
  var $addressElements = $(this).find('#address_elements');
  var $errorMessage = $(this).find('p.error');
  var $manualEntry = $(this).find('#manual_entry')
  
  var toggleElements = function() {
    $postcodeInput.parent('div').toggleClass('hidden');
    $addressSelect.parent('div').toggleClass('hidden');
    $yourPostcode.toggleClass('hidden');
    $findAddress.toggleClass('hidden');
    $errorMessage.toggleClass('hidden');
    $manualEntry.toggleClass('hidden');
    
    $addressElements.addClass('hidden');
  }
  
  var formatAddress = function(address) {
    return [address.line_1, address.line_2, address.line_3, address.post_town, address.postcode].filter(function(item) {
      return item.length > 0
    }).join(', ');
  }
    
  $findAddress.on('click', function() {
    var postcode = $postcodeInput.val();
    var url = baseUrl + postcode + '?api_key=' + apiKey;
    $.get(url).done(function(data) {
      $addressSelect.empty();
      $addressSelect.append('<option>Please Select</option>');
      $.each(data.result, function(i, address) {
        postcode = address.postcode
        $option = $('<option></option>')
        $option.data('line_1', address.line_1)
        $option.data('line_2', address.line_2)
        $option.data('line_3', address.line_3)
        $option.data('post_town', address.post_town)
        $option.data('postcode', address.postcode)
        $option.text(formatAddress(address))
        $addressSelect.append($option)
      })
      $yourPostcode.find('p.postcode span').text(postcode);
      toggleElements();
    })
    .fail(function() {
      $('p.error').removeClass('hidden').text('Postcode is not recognised, please try again.');
    })
  });
  
  $yourPostcode.find('#change_postcode').on('click', function(e) {
    toggleElements();
    e.preventDefault();
  });
  
  $addressSelect.on('change', function() {
    var data = $(this).find(':selected').data();
    $('.line_1').val(data.line_1)
    $('.line_2').val(data.line_2)
    $('.line_3').val(data.line_3)
    $('.post_town').val(data.post_town)
    $('.postcode').val(data.postcode)
    $addressElements.removeClass('hidden');
    $('.add-address').removeClass('hidden');
  });
  
  $manualEntry.on('click', function(e) {
    $findAddress.addClass('hidden');
    $addressElements.removeClass('hidden');
    $postcodeInput.parent('div').addClass('hidden');
    $(this).addClass('hidden');
    $('.confirm').removeClass('hidden');
    e.preventDefault();
  })
  
};
