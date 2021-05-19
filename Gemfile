source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.5'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'bootstrap-sass', '~> 3.4.1'
gem 'faker', git: 'https://github.com/faker-ruby/faker.git', branch: 'master'
gem 'jbuilder', '~> 2.7'
gem 'puma', '~> 5.3'
gem 'rails', '~> 6.0.2', '>= 6.0.2.1'
gem 'rubocop'
gem 'rubocop-faker'
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'
gem 'jquery-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails'
gem 'by_star', git: "git://github.com/radar/by_star"
gem 'chartkick'
gem 'groupdate', '~> 5.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'sqlite3', '~> 1.4'
  gem 'rspec-rails', '~> 4.0.0'
  gem 'capybara', '>= 2.15'
  gem 'minitest-reporters'
  gem 'rails-controller-testing'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
