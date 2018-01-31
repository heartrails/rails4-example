source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.2.0'

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

gem 'jquery-rails', '~> 3.1.0'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', '~> 2.2.0'

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

gem 'activerecord-session_store', '~> 1.0.0'
gem "exception_notification"
gem "haml-rails"
gem "simple_form", '~> 3.5.0'
gem "kaminari"
gem "factory_girl_rails"
gem 'faker'
gem "cancan", github: "ryanb/cancan", branch: "2.0"
gem 'therubyracer'
gem "less-rails", '~> 3.0.0'
gem "twitter-bootstrap-rails"
gem 'font-awesome-less', '~> 4.5.0'
gem "jquery-ui-rails", '~> 5.0.0'
gem 'ransack', github: 'activerecord-hackery/ransack', branch: 'rails-4.2'
gem 'memcachier'
gem 'dalli'

group :development do
  gem "i18n_generators", github: "amatsuda/i18n_generators"
  gem "better_errors"
  gem 'binding_of_caller'
  gem 'annotate'
  gem "pry-rails"
  gem 'web-console', '~> 2.0'
end

group :development, :test do
  gem "rspec-rails", '~> 3.1.0'
  gem "capybara"
  gem 'spring'
  gem 'sqlite3'
  gem 'ci_reporter'
  gem 'simplecov'
  gem 'simplecov-rcov'
end

group :test do
  gem 'test_after_commit', '~> 0.4.0'  # to test after_commit
end

gem 'rails_12factor', group: :production
gem 'responders', '~> 2.0'
