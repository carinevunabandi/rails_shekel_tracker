ENV["RACK_ENV"] = "test"

# require 'byebug'
require "capybara"
require "capybara/cucumber"
require "cucumber/rails"
require "database_cleaner"
require "factory_bot_rails"
require "site_prism"
require "selenium-webdriver"

World(FactoryBot::Syntax::Methods)

DatabaseCleaner.strategy = :truncation

Before do
  DatabaseCleaner.clean
  DatabaseCleaner.start
end

After do
  DatabaseCleaner.clean
end
