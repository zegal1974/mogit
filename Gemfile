source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '>= 2.6.1'

gem 'rails', '~> 6.1.3', '>= 6.1.3.1'

gem 'sqlite3', '~> 1.4'
# gem 'pg'
# gem 'enum_i18n'

gem 'bulk_insert'

gem 'puma', '~> 5.0'

gem 'sass-rails', '>= 6'

gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

gem 'rufus-lua'

gem 'hamlit'

gem 'sassc-rails', '~> 2.1.0'

# i18n
gem 'rails-i18n'
# gem 'gettext_i18n_rails', '~> 1.8.0'
# gem 'gettext_i18n_rails_js', '~> 1.3'
# gem 'gettext', '~> 3.3', require: false, group: :development

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'pry-shell'
  gem 'bullet'

  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 5.0.0'

  gem 'awesome_print', require: false

  gem 'spring'
  gem 'spring-commands-rspec'
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'

  gem 'better_errors'
  gem 'listen', '~> 3.3'

  gem 'rails-erd'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'minitest', require: false
  gem 'simplecov', require: false
  gem 'test-prof'
  gem 'rails-controller-testing'
  gem 'shoulda-matchers', '~> 4.0'
  # gem 'selenium-webdriver'
  # gem 'webdrivers'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
