class NameChangeRule < Incredible::Rule
  
  def process
    @next_step = params[:application][:name_change] == '1' ? :what_is_your_name_change : :gender
  end
  
end
