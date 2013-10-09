if RUBY_VERSION =~ /1.9/
  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
end

source 'https://rubygems.org'

gem 'rails', '4.0.0'
gem 'mysql2'

gem 'bourbon', '~> 3.1.6'
gem 'coffee-rails', '~> 4.0.0'
gem 'dotenv-rails'
gem 'haml-rails', github: 'indirect/haml-rails'
gem 'httparty', '~> 0.11.0'
gem 'jquery-rails', '2.1.4'
gem 'omniauth-twitter'
gem 'redcarpet', '~> 3.0.0'
gem 'friendly_id', '~> 5.0.0.rc1'
gem 'simple_form', '~> 3.0.0'
gem 'turbolinks'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', '~> 4.0.0'
  gem 'therubyracer', '~> 0.12.0'
  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem 'capistrano', '~> 2.15.5'
  gem 'capo', '~> 0.9.2', require: false
end

group :test do
  gem 'capybara', '~> 2.1.0'
  gem 'database_cleaner', '~> 1.1.1'
  gem 'minitest'
  gem 'sqlite3'
  gem 'turn'
end

group :development, :test do
  gem 'quiet_assets'
end
