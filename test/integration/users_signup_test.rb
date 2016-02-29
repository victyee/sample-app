require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

	test "invalid sign up information" do
  	get signup_path
  	assert_no_difference 'User.count' do 
  		post user_path, user: { name: "", email: "user@invalid.com", password: "foo", password_confirmation: "bar"}
  	end
  	assert_template 'users/new'
  end

  test "valid sign up information" do
  	get signup_path
  	assert_difference 'User.count', 1 do 
  		post_via_redirect, user_path, user: { name: "Example User", email: "user@valid.com", password: "passowrd", password_confirmation: "password"}
  	end
  	assert_template 'users/show'
end
