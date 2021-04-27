# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'action_policy'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'clearance'
gem 'doorkeeper', '~> 5.0.2', '>= 5.0.2'
gem 'graphql'
gem 'mutations'
gem 'pg'
gem 'puma'
gem 'rack-cors'
gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
gem 'redis'
gem 'sidekiq'
gem 'strong_migrations'

group :development, :test do
  gem 'fabrication'
  gem 'faker'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'simplecov', require: false
end

group :development do
  gem 'annotate'
  gem 'brakeman'
  gem 'bundler-audit', '~> 0.8.0.rc1'
  gem 'listen', '~> 3.2'
  gem 'pry-rescue'
  gem 'rubocop'
  gem 'rubocop-graphql'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
