ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  fixtures :all
  # Returns true if a test user is logged in.
  def is_logged_in?
    !session[:customer_id].nil?
  end

  def log_in_as(customer)
    session[:customer_id] = customer.id
  end

  class ActionDispatch::IntegrationTest

  # Log in as a particular customer.
  def log_in_as(customer, password: 'password', remember_me: '1')
    post login_path, params: { session: { email: customer.email,
                                          password: password,
                                          remember_me: remember_me } }
  end
  end
end
