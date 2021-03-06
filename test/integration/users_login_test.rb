require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:test)
  end

  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: {email: "", password: ""}}
    assert_template 'sessions/new'
    assert_not flash.empty?
    get signup_path
    assert flash.empty?
  end

  test "login with valid information" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: '123456' } }
    assert_redirected_to @user
    follow_redirect!
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
  end

  test "login with valid information followed by logout" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: '123456' } }
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to login_path
    delete logout_path
    follow_redirect!
    assert_select "a[href=?]", login_path
  end

  test "new ingredient path only shows if logged in" do
    get login_path
    assert_select "a[href=?]", 'ingredients/new', count: 0
    post login_path, params: { session: { email:    @user.email,
                                          password: '123456' } }
    assert_redirected_to @user
    follow_redirect!
    assert_select "a[href=?]", '/ingredients/new'
  end

  test "new recipe path only shows if logged in" do
    get login_path
    assert_select "a[href=?]", 'recipes/new', count: 0
    post login_path, params: { session: { email:    @user.email,
                                          password: '123456' } }
    assert_redirected_to @user
    follow_redirect!                                      
    assert_select "a[href=?]", '/recipes/new'
  end

  test "new ingredient page only accessible if logged in" do
    get '/ingredients/new'
    assert_select "form", false
    assert_select "div.alert-danger"
    post login_path, params: { session: { email:    @user.email,
                                          password: '123456' } }
    get '/ingredients/new'                                   
    assert_select "form"
    assert_select "div.alert-danger", false
  end

  test "new recipe page only accessible if logged in" do
    get '/recipes/new'
    assert_select "form", false
    assert_select "div.alert-danger"
    post login_path, params: { session: { email:    @user.email,
                                          password: '123456' } }
    get '/recipes/new'                                    
    assert_select "form"
    assert_select "div.alert-danger", false
  end

  test "user menu and index only accessible if logged in" do
    get users_path
    assert_redirected_to login_path
    assert_select "a[href=?]", '/users', count: 0
    post login_path, params: { session: { email:    @user.email,
                                          password: '123456' } }
    follow_redirect!                                  
    assert_select "a[href=?]", '/users'
    get users_path
  end

  test "login with remembering" do
    log_in_as(@user, remember_me: '1')
    assert_not_empty cookies['remember_token'] 
  end

  test "login without remembering" do
    log_in_as(@user, remember_me: '1')
    log_in_as(@user, remember_me: '0')
    assert_empty cookies['remember_token']
  end

end
