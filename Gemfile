source 'http://ruby.taobao.org'

gem 'rails', '3.2.16'
gem "mongoid"

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'bootflat-rails'
gem 'bootstrap_form', :git => 'https://github.com/bootstrap-ruby/rails-bootstrap-forms.git',  :tag => 'v1.0.0'

# Gems used only for assets and not required
# in production environments by default.
gem 'sass', '3.4.5'
group :assets do
 gem 'sass-rails',   '~> 3.2.3'
# gem 'sass-rails', '~> 5.0.0.beta1'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

group :test do 
  gem 'rspec-rails', :platforms => [:ruby]
  gem 'mongoid-rspec', '~> 1.11.0', :platforms => [:ruby]
  gem 'spork-rails', :platforms => [:ruby]
  gem 'database_cleaner', '1.0.1', :platforms => [:ruby]
end

group :development, :test do
  gem 'factory_girl_rails'
end