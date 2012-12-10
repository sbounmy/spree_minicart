source 'http://rubygems.org'

gemspec

if ENV['USE_LOCAL_SPREE']
  gem 'spree_core', :path => '~/code/spree'
else
  gem 'spree_core', :git => 'git://github.com/spree/spree.git', :branch => '1-3-stable'
end
