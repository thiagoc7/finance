source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails'
gem 'sqlite3'
gem 'puma'
gem 'sass-rails'
gem 'uglifier'

gem 'coffee-rails'
gem 'turbolinks'
gem 'jbuilder'

gem 'bootstrap', '~> 4.1.1'
gem 'jquery-rails'
gem 'octicons_helper'
gem "bootstrap_form",
    git: "https://github.com/bootstrap-ruby/rails-bootstrap-forms.git",
    branch: "master"


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'guard-livereload', '~> 2.5', require: false
  gem "rack-livereload"
end