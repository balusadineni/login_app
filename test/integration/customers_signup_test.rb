require 'test_helper'

class CustomersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'Customer.count' do
      post customers_path, params: { customer: { name:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    assert_template 'customers/new'
  end

    test "valid signup information" do
    get signup_path
    assert_difference 'Customer.count', 1 do
      post customers_path, params: { customer: { name:  "Example User",
                                         email: "user@example.com",
                                         password:              "password",
                                         password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template 'customers/show'
    assert is_logged_in?
  end
end
