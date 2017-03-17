source 'https://rubygems.org'
# source 'https://gems.gzruby.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.2'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'factory_girl_rails'
  gem 'rspec-rails'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rails_best_practices'
  gem 'guard-rails', require: false
  gem 'guard-rspec', require: false
  gem 'guard-livereload', '~> 2.5', require: false
  gem "rack-livereload"
end

group :test do
  gem 'simplecov', :require => false
end

group :production do
  gem 'pg'
  gem 'thin'
end
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'devise'
gem 'exception_notification'

gem 'bootstrap-sass'
gem "font-awesome-rails"

gem 'hamlit-rails'

# https://github.com/activerecord-hackery/ransack
gem 'ransack'

# https://github.com/amatsuda/kaminari
gem 'kaminari'
gem 'bootstrap-kaminari-views'

# https://github.com/plataformatec/simple_form
gem 'simple_form'

# https://github.com/ryanb/nested_form
gem 'nested_form'

gem "thor", '= 0.19.1'

gem 'unobtrusive_flash', '>=3'

# https://github.com/TrevorS/bootstrap3-datetimepicker-rails
gem 'momentjs-rails', '>= 2.9.0'
gem 'bootstrap3-datetimepicker-rails', '~> 4.17.43'

gem 'config'
