class EmploymentHistoryRule < ApplicationRule
  def process
    @next_step = params[:application][:employment_type] == 'unemployed' ? :full_address : :national_insurance
  end
end
