class PreviousAddressesRule < FullAddressRule
  
  def process
    address_params = params[:application][:addresses_attributes].values.first
    date = build_date(address_params)
    @next_step = years_ago(date) >= 5 ? :adults_living_at_home : :previous_addresses
  end
  
end
