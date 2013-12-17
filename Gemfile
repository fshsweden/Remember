source 'http://rubygems.org'

gem 'rails'
gem 'devise'
gem 'rails-i18n'
gem 'devise-i18n'
gem "paperclip", "~> 3.0"
gem 'wicked'
gem 'detect_timezone_rails'
gem 'activemerchant'
gem 'paypal-sdk-rest'
gem 'yaml_db'
gem 'skeuocard-rails', '1.0.0beta'
gem 'http_accept_language', '~> 2.0.0.pre' # A small effort in making a plugin which helps you detect the users preferred language, as sent by the HTTP header.
gem 'simple_form'
gem 'country_select'
gem 'jquery-rails'
gem 'nifty-generators'
gem 'kaminari'  #pagination

gem 'omniauth-twitter'
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'

gem 'twitter'
gem 'fb_graph'
gem 'cancan'
gem 'nested_form'
gem 'thin' 				    # solves: "WARN  Could not determine....."  etc in log file
gem 'rails_admin'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :development do
  gem 'sqlite3'
  gem 'quiet_assets' #fantastic gem of a gem!
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'less-rails'
  gem 'coffee-rails', '~> 3.2.1'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'jquery-rails'
  gem 'uglifier', '>= 1.0.3'
  gem 'jquery-ui-rails'
  gem 'compass-rails' #NEW
  #gem 'zurb-foundation'
  gem 'foundation-rails'
end

# Keeping these inside :assets group causes error when running rake assets:precompile:all in production!!!
# *** INVESTIGATE WHY? ***
# 2013-10-03 MOVED THEM BACK INTO ASSETS WHERE THEY BELONG - KEEP TRACK OF!
#gem 'jquery-ui-rails'
#gem 'compass-rails' #NEW
#gem 'zurb-foundation'

group :test do
  gem "mocha", :require => false
end

group :development, :test do
	gem 'rspec-rails'
	gem 'factory_girl_rails'
end

group :test do
	gem 'faker'
	gem 'capybara'
	gem 'guard-rspec'
	gem 'launchy'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'
# To use Jbuilder templates for JSON
# gem 'jbuilder'
# Use unicorn as the app server
# gem 'unicorn'
# Deploy with Capistrano
# gem 'capistrano'
# To use debugger
# gem 'debugger'


