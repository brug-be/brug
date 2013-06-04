if RUBY_VERSION =~ /1.9/
  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
end

source 'https://rubygems.org'

gem 'rails', '4.0.0.rc1'
gem 'mysql2'

gem 'bourbon', '~> 3.1.6'
gem 'coffee-rails', '~> 4.0.0'
gem 'dotenv-rails'
gem 'haml-rails'
gem 'httparty', '~> 0.11.0'
gem 'jquery-rails', '2.1.4'
gem 'omniauth-twitter'
gem 'redcarpet', '~> 2.3.0'
gem 'friendly_id', github: 'FriendlyId/friendly_id', branch: 'rails4'
gem 'simple_form', github: 'plataformatec/simple_form'
gem 'turbolinks'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', '~> 4.0.0.rc1'
  gem 'therubyracer'
  gem 'uglifier', '>= 1.3.0'
end

group :development do
end

group :test do
  gem 'capo'
  gem 'capybara'
  gem 'database_cleaner', '~> 1.0.1'
  gem 'minitest'
  gem 'sqlite3'
  gem 'turn'
end

group :development, :test do
  gem 'quiet_assets'
end
