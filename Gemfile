# frozen_string_literal: true

source 'https://flipplib.jfrog.io/flipplib/api/gems/flipp-gems/'

# Use Config to define application configuration
gem 'config', '~> 2.2.3'

gem 'flipp-ruby-kafka', '~> 2.3', require: 'flipp_ruby_kafka'

# Use SCSS for stylesheets
gem 'sassc-rails', '~> 2.1'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use Puma as the app server
gem 'puma', '~> 4.3'

# silences /ping route
gem 'silencer', '~> 1.0', require: false

gem 'activerecord-import', '~> 1.0'
gem 'mysql2', '~> 0.4'
gem 'will_paginate', '~> 3.1'

gem 'rails', '~> 6.1'

# For Linux
gem 'tzinfo-data', '~> 1.2021'

gem 'flipp-rails-logger', '~> 1.0', require: false

# Datadog
gem 'ddtrace', '~> 0.28', require: false
gem 'flipp-ruby-dogstatsd', '~> 1.0.0'

gem 'opentelemetry-sdk'
gem 'opentelemetry-exporter-otlp'
gem 'opentelemetry-instrumentation-all'
gem 'opentelemetry-instrumentation-aws_sdk'

group :development, :test do
  gem 'flipp_ruby_style'
  gem 'guard'
  gem 'guard-rspec'
  gem 'listen', '~> 3.4.1'
  gem 'pry', require: false
  gem 'pry-byebug', require: false
  gem 'retriable'
end

group :test do
  gem 'database_cleaner', '~> 1.8'
  gem 'factory_bot_rails', '~> 6.1'

  gem 'rspec-rails', '~> 4'
  gem 'simplecov'
  # Required to collect build workflow data
  gem 'rspec_junit_formatter', '~> 0.4'
end

group :development do
  gem 'annotate', '~> 3.0'

  gem 'better_errors', '~> 2.9'
  gem 'binding_of_caller', '~> 1.0'
  gem 'gha_config'
end
