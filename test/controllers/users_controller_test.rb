require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:michael)
    @other_user = users(:archer)
  end 
  
  test "should get new" do
    get signup_path
    assert_response :success
  end
  
  test "should redirect edit when not logged in" do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    #patchはupdateアクションへと繋ぐ
    patch user_path(@user), params: { user: { name: @user.name,
                                              email: @user.email } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end
  
  test "should redirect edit when logged in as wrong user" do
    t_log_in(@other_user)
    get edit_user_path(@user)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect update when logged in as wrong user" do
    t_log_in(@other_user)
    patch user_path(@user), params: { user: { name: @user.name,
                                              email: @user.email,
                                              password: "password",
                                              password_confirmation: "password"}}

    assert_redirected_to root_url
  end
  
  test "should not allow the admin attribute to be edited via the web" do
    t_log_in(@other_user)
    assert_not @other_user.admin?
    patch user_path(@other_user),params:{user:{password: "password",
                                              password_cofirmation: "password",
                                              admin: true}}
    assert_not @other_user.admin?
  end 

end
