# README

This repository contains my starter pack for creating new GraphQL API projects with Ruby on Rails.

## Dependencies

- action_policy
- annotate
- brakeman
- bundler-audit
- clearance
- doorkeeper
- fabrication
- faker
- graphql
- pg
- pry
- rspec
- rubocop
- sidekiq
- simplecov
- strong_migrations

## Configuration

- fork the project
- rename database in `config/database.yml`
- rename file `app/graphql/rails_api_template_schema.rb`
- rename channel_prefix in `config/cable.yml`
- bundle
- rake db:create db:migrate
