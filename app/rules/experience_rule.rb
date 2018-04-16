class ExperienceRule < ApplicationRule
  def process
    @next_step = params[:application][:experience] == 'no_experience' ? :housing_type : :age_experience
  end
end
