source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

gem 'sinatra'

# loads environment variables
gem 'dotenv'



# db
gem 'pg', '1.2.3'
gem 'activerecord'
gem 'sinatra-activerecord'
gem 'rake'

gem 'json', '~> 2.6', '>= 2.6.3'

# background request
gem 'httparty', '0.18.1'

group :test, :development do
  gem 'pry'
  gem 'pry-rails', '0.3.9'
  gem 'factory_bot_rails', '6.1.0'
  gem 'faker', '2.15.1'
  # docker needed ssh gems
  gem 'ed25519', '1.2.4'
  gem 'pre-commit', '0.39.0', require: false
  gem 'pronto', '0.11.0'
  gem 'pronto-rubocop', '0.11.1', require: false
  gem 'rubocop', '1.19', require: false
end

group :test do
  gem 'shoulda-matchers', '4.1.2'
  gem 'poltergeist', '1.18.1'
  gem 'connection_pool', '2.3.0'
  gem 'letter_opener', '1.7.0'
  gem 'simplecov', '0.16.1', require: false
  gem 'fuubar', '2.5.1'
  gem 'rspec_junit_formatter', '0.4.1'
end

