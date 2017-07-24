require 'simplecov'
require File.expand_path('../../config/environment', __FILE__)
SimpleCov.start
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def is_logged_in?
    !session[:user_id].nil?
  end

  def login_as(user)
    session[:user_id] = user.id
  end

end

class ActionDispatch::IntegrationTest

  def login_as(user, password: 'password')
    post login_path, params: { session: { email: user.email, password: password } }
  end

end
