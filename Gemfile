source 'https://rubygems.org'

# `github` shorthand set to be use `https` protocol instead of `git` protocol.
# @see https://github.com/rails/rails/commit/12d5c21031446686898d5bac924ff3e9e34b6a7d
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.2.0'

gem 'pg', '~> 0.20.0'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', '~> 5.1'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'

# To use ActiveModel has_secure_password
gem 'bcrypt'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano', group: :development

# To use debugger
# gem 'debugger'

gem 'activerecord-session_store', '~> 1.1'
gem 'exception_notification'
gem 'haml-rails'
gem 'simple_form', '~> 3.5'
gem 'kaminari'
gem 'factory_bot_rails'
gem 'faker'
gem 'cancan', github: 'ryanb/cancan', branch: '2.0'
gem 'therubyracer'
gem 'less-rails', '~> 3.0'
gem 'twitter-bootstrap-rails', '~> 2.2'
gem 'font-awesome-less', '~> 4.7'
gem 'jquery-ui-rails'
gem 'ransack'
gem 'memcachier'
gem 'dalli'
gem 'responders', '~> 2.0'

group :development do
  gem 'i18n_generators', '~> 2.1'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'annotate'
  gem 'pry-rails'
  gem 'web-console', '~> 2.0'
end

group :development, :test do
  gem 'rspec-rails', '~> 3.7'
  gem 'capybara'
  gem 'spring'
  gem 'ci_reporter'
  gem 'simplecov'
  gem 'simplecov-rcov'
end

group :test do
  gem 'test_after_commit' # to test after_commit
end

gem 'rails_12factor', group: :production
