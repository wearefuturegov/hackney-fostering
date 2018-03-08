class PreviousAddressRule
  
  def self.process(params)
    address_params = params[:application][:addresses_attributes].values.first
    date = build_date(address_params)
    years_ago(date) >= 5 ? :children_living_at_home : :previous_addresses
  end
  
  def self.build_date(address_params)
    Time.new(
      address_params['date_from(1i)'].to_i,
      address_params['date_from(2i)'].to_i,
      address_params['date_from(3i)'].to_i
    )
  end
  
  def self.years_ago(date)
    Time.now.utc.to_date.year - date.year
  end
  
end
