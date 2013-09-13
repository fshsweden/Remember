source 'https://rubygems.org'

gem 'rails', '3.2.13'
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

gem 'omniauth-twitter'
gem 'omniauth-facebook'
gem 'twitter'
gem 'fb_graph'
gem 'cancan'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :development do
  #gem 'thin' 				    # solves: "WARN  Could not determine....."  etc in log file
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
  gem 'coffee-rails', '~> 3.2.1'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'jquery-rails'
  gem 'uglifier', '>= 1.0.3'
end

# Keeping these inside :assets group causes error when running rake assets:precompile:all in production!!!
# *** INVESTIGATE WHY? ***
gem 'jquery-ui-rails'
gem 'compass-rails' #NEW
gem 'zurb-foundation'

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

gem "mocha", :group => :test
