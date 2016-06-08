source 'https://rubygems.org'

ruby '2.2.5'

gem 'rails', '4.2.1'
gem 'rails-api'
gem 'spring', :group => :development
gem 'pg'
gem 'foreman'

# To use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

group :development do
  gem 'capistrano'
  gem 'thin'
end

group :test do
  gem 'rspec'
  gem "factory_girl_rails", "~> 4.0"
  gem 'database_cleaner'
  gem 'shoulda-matchers', '~> 3.1'
end

group :development, :test do
  gem 'rspec-rails', '~> 3.4'
  gem 'ffaker'
  gem 'pry'
  gem 'pry-byebug'
end
