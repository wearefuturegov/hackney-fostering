class AddressDecorator < MainDecorator
  def full_address
    [
      address.line_1,
      address.line_2,
      address.line_3,
      address.post_town,
      address.postcode
    ].reject(&:blank?).join(',<br/>').html_safe
  end
  
  def date_from
    standard_wrapper('Date moved in', address.date_from&.to_s(:long))
  end
  
  def date_to
    standard_wrapper('Date moved out', address.date_to&.to_s(:long))
  end
end
