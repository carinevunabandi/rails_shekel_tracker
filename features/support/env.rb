ENV["RACK_ENV"] = "test"

require "capybara"
require "capybara/cucumber"
# require "capybara/poltergeist"
require "cucumber/rails"
require "database_cleaner"
require "factory_bot_rails"
require "site_prism"
require "selenium-webdriver"

World(FactoryBot::Syntax::Methods)

# Capybara.register_driver :phantomjs do |app|
#     options = {js_errors: true, phantomjs_logger: STDOUT}
#     Capybara::Poltergeist::Driver.new(app, options)
# end

Capybara.server = :webrick
# Capybara.javascript_driver = :phantomjs

# Capybara.app = ShekhelTracker
Capybara.default_max_wait_time  = 10
# Capybara.default_driver = :selenium
Capybara.javascript_driver = :selenium

DatabaseCleaner.strategy = :truncation

Before do
  DatabaseCleaner.clean
  DatabaseCleaner.start
end

After do
  DatabaseCleaner.clean
end
