source 'https://rubygems.org'
ruby "3.1.3"

gem 'rails', '~> 5.1.4'
gem "haml-rails"
gem 'jquery-rails'
gem 'bootstrap-sass', '~> 3.4.1'

# adds browser vendor prefixes 
gem 'autoprefixer-rails'

gem 'puma'
gem 'pg', '~> 1.4.5'

group :development do
  gem 'pry-rails'
  gem 'brakeman', require: false
  gem 'bundler-audit', require: false
end

gem 'dropbox_api', '~> 0.1.21'

# require Github markup gem for text to html converters
gem 'github-markup'
gem 'github-markdown', '~> 0.6.9'

# gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platform => :ruby
end
