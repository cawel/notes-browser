source 'https://rubygems.org'
ruby "2.4.1"

gem 'rails', '~> 5.1.4'
gem "haml-rails"
gem 'jquery-rails'
gem 'bootstrap-sass'

# adds browser vendor prefixes 
gem 'autoprefixer-rails'

gem 'puma'
gem 'pg', '~> 0.20'

group :development do
  gem 'pry-rails'
  gem 'listen'
  gem 'brakeman', require: false
  gem 'bundler-audit', require: false
end

gem 'dropbox_api'

# require Github markup gem for text to html converters
gem 'github-markup'
gem 'github-markdown'

# gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platform => :ruby
end

