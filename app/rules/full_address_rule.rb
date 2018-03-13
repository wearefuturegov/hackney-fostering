class FullAddressRule < Incredible::Rule
  
  def process
    address_params = params[:application][:address_attributes]
    date = build_date(address_params)
    @next_step = years_ago(date) >= 5 ? :adults_living_at_home : :previous_addresses
  end
  
  def build_date(address_params)
    Time.new(
      address_params['date_from(1i)'].to_i,
      address_params['date_from(2i)'].to_i,
      address_params['date_from(3i)'].to_i
    )
  end
  
  def years_ago(date)
    Time.now.utc.to_date.year - date.year
  end
  
end
