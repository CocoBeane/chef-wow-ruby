require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_select 'form'

    assert_no_difference 'User.count' do
      post users_path, params: { user: {name: "",
                                email: "user@invalid",
                                password: "test",
                                password_confirmation: "test"}
                              }
    end

    assert_select 'div#error_explanation'
  end

  test "valid signup information" do
    get signup_path

    assert_difference 'User.count' do
      post users_path, params: { user: {name: "ABC",
                                email: "abc@123.com",
                                password: "abc123",
                                password_confirmation: "abc123"}
                              }      
    end

    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end

end
