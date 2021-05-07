require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @user = users(:michael)
  end
  
  test "form user profile to questions/show" do
    get user_path(@user)
    assert_template 'users/show'
    @user.questions.each do |q|
      get question_path(q)
      assert_response :success
    end 
  end
  


end 