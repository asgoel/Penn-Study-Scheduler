ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

require 'capybara/rails'

# Transactional fixtures do not work with Selenium tests, because Capybara
# uses a separate server thread, which the transactions would be hidden
# from. We hence use DatabaseCleaner to truncate our test database.
DatabaseCleaner.strategy = :truncation

class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL

  # Stop ActiveRecord from wrapping tests in transactions
  self.use_transactional_fixtures = false
  def login
    User.create(first_name: 'Sam', last_name: 'Smith', email: 'agoel981@gmail.com', password: 'test1234')
	visit new_user_session_path
	fill_in 'Email', with: 'agoel981@gmail.com'
	fill_in 'Password', with: 'test1234'
	click_button 'Sign in'
  end

  setup do
    DatabaseCleaner.start
    Capybara.current_driver = :selenium
    page.driver.options[:resynchronize] = true
	Capybara.app_host = 'localhost:3000'
	login
  end
  teardown do
    DatabaseCleaner.clean # Truncate the database
    Capybara.reset_sessions! # Forget the (simulated) browser state
    Capybara.use_default_driver # Revert Capybara.current_driver to Capybara.default_driver
  end
end
