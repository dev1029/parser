require 'rubygems'
require 'spork'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'

  require File.expand_path("../dummy/config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'

  Dir[Rails.root.join("../support/**/*.rb")].each { |f| require f }

  RSpec.configure do |config|
    config.include YandexMarketParserHelper

    config.infer_base_class_for_anonymous_controllers = false

    config.use_transactional_fixtures = true
  end
end

Spork.each_run do
end
