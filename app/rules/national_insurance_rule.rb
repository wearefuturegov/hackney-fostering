class NationalInsuranceRule < ApplicationRule
  def process
    @next_step = application.employment_type == 'unemployed' ? :full_address : :occupation
  end
end
