source 'https://rubygems.org'
git_source(:github){ |repo_name| "https://github.com/#{repo_name}.git" }

gem 'rails', '5.0.1'
gem 'sqlite3'
gem 'responders'
gem 'haml'
gem 'jquery-rails'
gem 'uglifier'
gem 'sass-rails'
gem 'therubyracer'
gem 'globalize', github: 'globalize/globalize'
gem 'carrierwave', github: 'carrierwaveuploader/carrierwave'
gem 'active_link_to'
gem 'autoprefixer-rails'
gem "auto_strip_attributes"

source 'https://rails-assets.org' do
  gem 'rails-assets-materialize'
end

group :development, :test do
  gem 'rspec-rails', '~> 3.5'
  gem 'factory_girl_rails'
  gem 'autotest-rails'
  gem 'rspec-autotest', github: 'rspec/rspec-autotest'
  gem 'pry'
  gem 'pry-stack_explorer'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'railroady'
  gem 'spring'
end

group :test do
  gem 'shoulda-matchers', github: 'thoughtbot/shoulda-matchers'
  gem 'simplecov', require: false
  gem 'faker'
  gem 'rspec_junit_formatter', '0.2.2'
  gem 'codecov', require: false
end
