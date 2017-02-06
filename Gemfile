source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.1'

# Use Puma as the app server
gem 'puma', '~> 3.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

#secrets
gem 'figaro'

#users
gem 'devise'

#OAuth2
gem 'oauth2'

#OAuth
gem 'oauth'

#omniauth-oauth2
gem 'omniauth'
gem 'omniauth-oauth2', '1.3.1'

#rest client
gem 'rest-client'

#open urls
gem 'launchy'

#interact w/ devise as API
gem 'devise_token_auth'

gem 'pg'

gem 'yelp', require: 'yelp'

#server side rendering for client
gem "react_on_rails", "~> 6"

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 2.7.2'

# Use jquery as the JavaScript library
gem 'jquery-rails'

group :development do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'pry'
  gem 'pry-byebug'

  # Use sqlite3 as the database for Active Record
  #gem 'sqlite3'

  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring

end

group :production do
  #gem 'pg'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'mini_racer', platforms: :ruby
