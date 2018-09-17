require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:test)
  end

  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name: "",
                                            email: "test@invalid",
                                            password: "test",
                                            password_confirmation: "ing"}}
    assert_template 'users/edit'
    assert_select "div.alert-danger"
  end

  test "successful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    name = "Testy McTesterson"
    email = "testing123@test.com"
    patch user_path(@user), params: { user: { name: name,
                                            email: email,
                                            password: "",
                                            password_confirmation: ""}}
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name, @user.name
    assert_equal email, @user.email
  end

  test "successful edit with friendly forwarding" do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_url(@user)
    name = "Testy McTesterson"
    email = "testing123@test.com"
    patch user_path(@user), params: { user: { name: name,
                                            email: email,
                                            password: "",
                                            password_confirmation: ""}}
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name, @user.name
    assert_equal email, @user.email
  end

  test "friendly forwarding only occurs once" do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_url(@user)
    assert_nil session[:forwarding_url]
  end

end
