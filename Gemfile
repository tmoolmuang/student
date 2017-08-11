source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.5'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootstrap-sass'    
gem 'faker'         
gem 'devise'      
gem 'rack-cors', :require => 'rack/cors'

group :development, :test do
	gem 'sqlite3'
  gem 'byebug', platform: :mri
  gem 'spring'
  gem 'rspec-rails'
  gem 'shoulda'
  gem 'factory_girl_rails'
  gem 'capybara'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'letter_opener'
end

group :production do    
  gem 'pg'
  gem 'rails_12factor'  
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
