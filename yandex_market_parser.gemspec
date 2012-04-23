$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "yandex_market_parser/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "yandex_market_parser"
  s.version     = YandexMarketParser::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of YandexMarketParser."
  s.description = "TODO: Description of YandexMarketParser."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'httparty'
  s.add_dependency 'nokogiri'
  s.add_dependency 'rails'
  s.add_dependency 'sqlite3'
end
