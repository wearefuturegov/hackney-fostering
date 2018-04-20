class ExperienceRule < ApplicationRule
  def process
    @next_step = params[:application][:experience] == 'no_experience' ? :be_in_touch : :age_experience
  end
end
