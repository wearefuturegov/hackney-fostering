class ChildrenAtHomeRule < ApplicationRule
  def process
    @next_step = params['application']['children_at_home'] == 'false' ? :children_elsewhere : :children_living_at_home
  end
end
