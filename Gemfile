if RUBY_VERSION =~ /1.9/
  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
end

source 'https://rubygems.org'


gem 'rails',                '4.1.8'



# Default rails gems
gem 'mysql2'
gem 'sass-rails',           '~> 4.0.3'
gem 'uglifier',             '>= 1.3.0'
gem 'coffee-rails',         '~> 4.0.0'
gem 'therubyracer',                             platforms: :ruby
gem 'jquery-rails'
gem 'turbolinks'
# gem 'jbuilder',           '~> 2.0'
# gem 'sdoc',               '~> 0.4.0',         group: :doc
gem 'spring',                                   group: :development
# gem 'bcrypt',             '~> 3.1.7'
# gem 'unicorn'
# gem 'capistrano-rails',                       group: :development
# gem 'debugger',                               group: [:development, :test]



# Additional gems
gem 'bourbon',              '~> 3.1.6'
gem 'dotenv-rails'
gem 'friendly_id',          '~> 5.0.0.rc1'
gem 'haml-rails'
gem 'httparty',             '~> 0.11.0'
gem 'omniauth-twitter'
gem 'redcarpet',            '~> 3.0.0'
gem 'simple_form',          '~> 3.0.0'
gem 'twitter',              '~> 5.8.0'
gem 'whenever',             '~> 0.9.2',         require: false



group :development do
  gem 'capistrano',         '~> 2.15.5'
  gem 'capo',               '~> 0.9.2',         require: false
end

group :test do
  gem 'capybara',           '~> 2.1.0'
  gem 'database_cleaner',   '~> 1.1.1'
  gem 'minitest'
  gem 'sqlite3'
end

group :development, :test do
  gem 'quiet_assets'
end
