class PreviousAddressRule
  
  def self.process(params)
    address_params = params[:addresses_attributes].values.first
    date = Time.new(
      address_params['date_from(1i)'].to_i,
      address_params['date_from(2i)'].to_i,
      address_params['date_from(3i)'].to_i
    )
    years_ago(date) >= 5 ? :children_living_at_home : :previous_address
  end
  
  def self.years_ago(date)
    now = Time.now.utc.to_date
    now.year - date.year
  end
  
end
