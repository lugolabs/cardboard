source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.2.1'

# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'

# Use Puma as the app server
gem 'puma', '~> 3.7'

# Webpack
gem 'webpacker', '~> 4.0.0.pre.3'

# Bootstrap
gem 'bootstrap_form', github: 'bootstrap-ruby/rails-bootstrap-forms'

# Exceptions
gem 'exception_notification', github: 'smartinez87/exception_notification'

# Background jobs
gem 'sidekiq'

# Authentication
gem 'clearance'

# Ranking
gem 'ranked-model'

# Markdown
gem 'pygmentize'
gem 'redcarpet'

# Config
gem 'figaro'

group :development, :test do
  # Security
  gem 'brakeman', require: false
  gem 'bundler-audit', require: false, git: 'https://github.com/rubysec/bundler-audit.git'
  gem 'dawnscanner', require: false
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # gem 'listen', '~> 2.7.12'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # Code checks
  gem 'rubocop', require: false
end

group :test do
  # Adds support for Capybara system testing
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'

  # Mocking and stubbing
  gem 'mocha'
end
