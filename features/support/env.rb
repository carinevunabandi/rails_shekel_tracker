ENV["RACK_ENV"] = "test"

require "capybara"
require "capybara/cucumber"
require "cucumber/rails"
require "database_cleaner"
require "factory_bot_rails"
require "selenium-webdriver"
require "site_prism"

World(FactoryBot::Syntax::Methods)

Capybara.register_driver :chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(loggingPrefs: { browser: "ALL", client: "ALL", driver: "ALL", server: "ALL" })
  options = Selenium::WebDriver::Chrome::Options.new(args: %w[headless])
  Capybara::Selenium::Driver.new(app, port: 3000, browser: :chrome, desired_capabilities: capabilities, options: options)
end

Capybara.javascript_driver = :chrome
Capybara.server = :webrick
Capybara.default_max_wait_time  = 10

DatabaseCleaner.strategy = :truncation

Before do
  DatabaseCleaner.clean
  DatabaseCleaner.start
end

After do
  DatabaseCleaner.clean
end
