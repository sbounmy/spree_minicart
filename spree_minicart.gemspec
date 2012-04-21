# encoding: UTF-8
$:.push File.expand_path("../lib", __FILE__)
require "spree_minicart/version"

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_minicart'
  s.version     =  SpreeMinicart::VERSION
  s.summary     = 'Spree Minicart displays a minicart in your spree store'
  s.description = "Spree Minicart allows customer to add/remove an item from their cart without ever leaving the page they're on.Let your customers preview their cart before they start the checkout process."
  s.required_ruby_version = '>= 1.8.7'

  s.author            = 'Stéphane Bounmy'
  s.email             = 'stephanebounmy@gmail.com'
  s.homepage          = 'https://github.com/sbounmy/spree_minicart'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 1.0.0'
  s.add_dependency 'spree_sample'
  s.add_development_dependency 'capybara', '1.0.1'
  s.add_development_dependency 'factory_girl'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 2.7'
  s.add_development_dependency 'sqlite3'

  if RUBY_VERSION < "1.9"
    s.add_development_dependency "ruby-debug"
  else
    s.add_development_dependency "ruby-debug19"
  end

end
