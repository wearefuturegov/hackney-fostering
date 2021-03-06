source 'https://rubygems.org'
ruby '2.4.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.6'
# Use postgresql as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'webpacker'

gem 'haml'
gem 'decent_exposure', '3.0.2'
gem 'simple_form'
gem 'dotenv-rails'
gem 'hashids'
gem 'linguistics'
gem 'draper'
gem 'airbrake', require: false
gem 'memoist'
gem 'devise'
gem 'que'
gem 'appsignal'
gem 'sendgrid_actionmailer_adapter'

if ENV['USE_LOCAL_INCREDIBLE']
  gem 'incredible', path: '../incredible'
else
  gem 'incredible' # rubocop:disable Bundler/DuplicatedGem
end


gem 'geff', git: 'https://github.com/wearefuturegov/geff.git'
# if ENV['USE_LOCAL_GEFF']
#   gem 'geff', path: '~/futuregov/geff'
# else
# end

# For seeding test data
gem 'fabrication'
gem 'ffaker'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 3.3'
  gem 'rspec-rails'
  gem 'rubocop'
  gem 'selenium-webdriver'
  gem 'pry'
  gem 'rspec_junit_formatter'
  gem 'coveralls'
  gem 'turnip'
  gem 'capybara-selenium'
  gem 'chromedriver-helper'
  gem 'launchy'
  gem 'database_cleaner'
  gem 'email_spec'
  gem 'rails-controller-testing'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
