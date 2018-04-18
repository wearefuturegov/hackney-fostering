class ChildrenElsewhereRule < ApplicationRule
  def process
    @next_step = params['application']['children_living_elsewhere'] == 'false' ? :adults_at_home : :children_living_elsewhere
  end
end
