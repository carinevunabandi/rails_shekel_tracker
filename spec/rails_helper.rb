 ENV['RAILS_ENV'] ||= 'test'
 abort("The Rails environment is running in production mode!") if Rails.env.production?
 require 'spec_helper'
 require 'rspec/rails'
