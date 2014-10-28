require 'spork'
ENV["RAILS_ENV"] = 'test'

# https://github.com/sporkrb/spork/issues/251
if Spork.using_spork?
  RSpec.configure do |config|
    config.reset
    config.output_stream = $stdout
  end
end

Spork.prefork do
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'

  Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }
  RSpec.configure do |config|

    config.order = "random"
    require 'database_cleaner'

    config.before(:suite) do
      DatabaseCleaner.strategy = :truncation
      DatabaseCleaner.orm = 'mongoid' # 注意这里
    end

    config.before(:each) do
      DatabaseCleaner.clean
    end

    config.render_views = true
    config.infer_spec_type_from_file_location!
    config.include Mongoid::Matchers, type: :model
  end
end

