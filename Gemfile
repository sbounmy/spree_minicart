source 'http://rubygems.org'

gem 'mysql2'
group :test do
  gem 'ffaker'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'launchy', '2.0.5'
end

if RUBY_VERSION < "1.9"
  gem "ruby-debug"
else
  gem "ruby-debug19"
end

group :assets do
  gem 'sass-rails',   '~> 3.1.5'
  gem 'uglifier', '>= 1.0.3'
end

gemspec
