class ChildrenLivingAtHomeRule < ApplicationRule
  def process
    @next_step = :children_living_elsewhere if params['application']['children_at_home'] == '0'
    @redirect = new_application_child_path(application_id: application.id) if params['application']['children_at_home'] == '1'
  end
end
