placeholder :path do
  match(/(.*)/) do |path|
    begin
      route = path.split(/\s+/).join('_')
      Rails.application.routes.url_helpers.send("#{route}_path".to_sym)
    rescue Object
      raise "Can't find mapping from \"#{page_name}\" to a path."
    end
  end
end

step 'I am on the :path' do |path|
  visit path
end
