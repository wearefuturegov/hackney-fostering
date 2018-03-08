require 'turnip/capybara'
require 'selenium/webdriver'
require 'rails_helper'

require 'support/turnip_formatter'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.register_driver :headless_chrome do |app|
  capabilities = if ENV['CIRCLECI'] || ENV['HEADLESS']
                   Selenium::WebDriver::Remote::Capabilities.chrome(
                     chromeOptions: { args: %w[headless disable-gpu] }
                   )
                 else
                   Selenium::WebDriver::Remote::Capabilities.chrome
                 end

  Capybara::Selenium::Driver.new app,
                                 browser: :chrome,
                                 desired_capabilities: capabilities
end

Capybara.javascript_driver = :headless_chrome
Capybara.raise_server_errors = false

RSpec.configure do |config|
  config.include Rails.application.routes.url_helpers
end

Dir.glob('spec/features/steps/**/*steps.rb') { |f| load f, true }
