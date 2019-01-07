ENV["RACK_ENV"] = "test"

require "capybara"
require "capybara/cucumber"
require "cucumber/rails"
require "database_cleaner"
require "factory_bot_rails"
require "selenium-webdriver"
require "site_prism"

World(FactoryBot::Syntax::Methods)

Capybara.server = :webrick
Capybara.default_max_wait_time  = 10
Capybara.javascript_driver = :selenium

DatabaseCleaner.strategy = :truncation

Before do
  DatabaseCleaner.clean
  DatabaseCleaner.start
end

After do
  DatabaseCleaner.clean
end
