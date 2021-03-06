require 'simplecov'
SimpleCov.start 'rails'

require 'rubygems'
require 'spork'
#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'

Spork.prefork do
# Loading more in this block will cause your tests to run faster. However,
# if you change any configuration or code from libraries loaded here, you'll
# need to restart spork for it take effect.

# This file is copied to spec/ when you run 'rails generate rspec:install'
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# This file is needed for making seeds for tests.
#require "#{Rails.root}/db/seeds/root_categories.rb"

  RSpec.configure do |config|

# It will delete all temp-test files for advertisement
    config.after(:all) do
      FileUtils.rm_rf("public/uploads/advertisement/adv_attachment/test")
    end

    ActiveSupport::Dependencies.clear if Spork.using_spork?
# Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
    config.fixture_path = "#{::Rails.root}/spec/fixtures"

    config.render_views

# If you're not using ActiveRecord, or you'd prefer not to run each of your
# examples within a transaction, remove the following line or assign false
# instead of true.
    config.use_transactional_fixtures = false

# If true, the base class of anonymous controllers will be inferred
# automatically. This will be the default behavior in future versions of
# rspec-rails.
    config.infer_base_class_for_anonymous_controllers = false
  end

end

Spork.each_run do
# This code will be run each time you run your specs.
  Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }
  FactoryGirl.reload
end