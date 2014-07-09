source 'https://rubygems.org'
ruby "2.1.1"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4'

gem 'pg'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  #gem 'sass-rails',   '~> 4.0.0.beta1'
  #gem 'coffee-rails', '~> 4.0.0.beta1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', platforms: :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.0.1'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano', group: :development

# To use debugger
# gem 'debugger'

gem 'activerecord-session_store'
gem "exception_notification"
gem "haml-rails"
gem "simple_form"
gem "kaminari"
gem "factory_girl_rails"
gem 'faker'
gem "cancan", :git => "git://github.com/ryanb/cancan.git", :branch => "2.0"
gem 'therubyracer'
gem "less-rails"
gem "twitter-bootstrap-rails"
gem 'font-awesome-less'
gem "jquery-ui-rails"
gem "ransack"
gem 'memcachier'
gem 'dalli'

group :development do
  gem "i18n_generators", git: "git://github.com/amatsuda/i18n_generators.git"
  gem "better_errors"
  gem 'binding_of_caller'
  gem 'annotate'
  gem "pry-rails"
end

group :development, :test do
  gem "rspec-rails"
  gem "capybara"
  gem 'spring'
  gem 'sqlite3'
  gem 'ci_reporter'
  gem 'rspec-legacy_formatters', github: 'kuboon/rspec-legacy_formatters'
  gem 'simplecov'
  gem 'simplecov-rcov'
  gem 'guard-rspec'
end

group :test do
  gem 'test_after_commit'  # to test after_commit
end
