source 'https://rubygems.org'

ruby '2.6.6'
gem 'rails', '4.2.11'


gem 'sass-rails', '~> 5.0.3'
gem 'uglifier', '>= 2.7.1'

gem 'jquery-rails'

# self added dependencies ========================
gem 'execjs'



group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
end

# for Heroku deployment - as described in Ap. A of ELLS book
group :development, :test do
  gem 'byebug'
  gem 'database_cleaner'
  gem 'cucumber-rails', require: false
  gem 'rspec-rails'

  gem 'pry'
  gem 'pry-byebug'

  # Use sqlite3 as the database for Active Record
  gem 'sqlite3', '~> 1.3.6'

  gem 'dotenv-rails'
end

group :production do
  gem 'pg', '~> 0.2'
  gem 'rails_12factor'
end

group :test do
  gem 'cucumber-rails', :require => false
  gem 'cucumber-rails-training-wheels' # some pre-fabbed step definitions
  gem 'database_cleaner' # to clear Cucumber's test database between runs
  gem 'capybara'         # lets Cucumber pretend to be a web browser
  gem 'launchy'          # a useful debugging aid for user stories
end

gem "themoviedb-api", "~> 1.4"

gem "omniauth", "~> 2.0"

gem "devise", "~> 4.9"

gem "omniauth-google-oauth2", "~> 1.1"

gem "omniauth-rails_csrf_protection", "~> 1.0"
