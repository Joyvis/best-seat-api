# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.2', '>= 6.0.2.2'
gem 'sqlite3', '~> 1.4'

group :test do
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
end

group :development, :test do
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-highlight'
  gem 'pry-rails'
end

group :development do
  gem 'listen'
  gem 'rails_best_practices'
  gem 'rubocop'
  gem 'spring'
  gem 'spring-watcher-listen'
end
