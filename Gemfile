source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'bootstrap-sass'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'geocoder'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'nested_form_fields'
gem 'paperclip'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.2'
gem 'rails-i18n'
gem 'sass-rails', '~> 5.0'
gem 'sqlite3'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'simplecov', require: false
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop', '~> 0.49.1', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end
