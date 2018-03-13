class EmploymentHistoryRule < Incredible::Rule
  def process
    @next_step = params[:application][:employment_type] == 'unemployed' ? :full_address : :national_insurance
  end
end
