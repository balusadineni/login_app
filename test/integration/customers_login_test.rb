require 'test_helper'

class CustomersLoginTest < ActionDispatch::IntegrationTest
  
  def setup
    @customer = customers(:subhash)
  end

  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: "", password: "" } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "login with valid information" do
    get login_path
    post login_path, params: { session: { email:    @customer.email,
                                          password: 'password' } }
    assert_redirected_to @customer
    follow_redirect!
    assert_template 'customers/show'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", customer_path(@customer)
  end

  test "login with valid information followed by logout" do
    get login_path
    post login_path, params: { session: { email:    @customer.email,
                                          password: 'password' } }
    assert is_logged_in?
    assert_redirected_to @customer
    follow_redirect!
    assert_template 'customers/show'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", customer_path(@customer)
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    delete logout_path
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path,      count: 0
    assert_select "a[href=?]", customer_path(@customer), count: 0
  end

  test "login with remembering" do
    log_in_as(@customer, remember_me: '1')
    assert_equal assigns(:customer).remember_token, cookies['remember_token']
  end

  test "login without remembering" do
    # Log in to set the cookie.
    log_in_as(@customer, remember_me: '1')
    # Log in again and verify that the cookie is deleted.
    log_in_as(@customer, remember_me: '0')
    assert_empty cookies['remember_token']
  end
end
