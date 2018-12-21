ENV["RACK_ENV"] = "test"

# require 'byebug'
require "capybara"
require "capybara/cucumber"
require "capybara/poltergeist"
require "cucumber/rails"
require "database_cleaner"
require "factory_bot_rails"
require "site_prism"

World(FactoryBot::Syntax::Methods)

Capybara.register_driver :poltergeist do |app|
  options = {js_errors: true}
  Capybara::Poltergeist::Driver.new(app, options)
end
Capybara.javascript_driver = :poltergeist
Capybara.server = :webrick

DatabaseCleaner.strategy = :truncation

Before do
  DatabaseCleaner.clean
  DatabaseCleaner.start
end

After do
  DatabaseCleaner.clean
end
