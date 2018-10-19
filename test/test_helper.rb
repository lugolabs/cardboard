require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require_relative 'support/sign_in_helper'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  include SignInHelper
end
