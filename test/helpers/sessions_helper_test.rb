require 'test_helper'

class SessionsHelperTest < ActionView::TestCase

  def setup
    @customer = customers(:subhash)
    remember(@customer)
  end

  test "current_customer returns right user when session is nil" do
    assert_equal @customer, current_customer
    assert is_logged_in?
  end

  test "current_customer returns nil when remember digest is wrong" do
    @customer.update_attribute(:remember_digest, Customer.digest(Customer.new_token))
    assert_nil current_customer
  end
end
