require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  def setup 
    @user = users(:michael)
  end
  
  test "should get new" do
    t_log_in(@user)
    get post_path
    assert_response :success
  end
  
  test "profile display" do
    get user_path(@user)
    assert_select 'span', text: @user.name
    assert_select 'h5', "投稿数 #{@user.questions.count.to_s}"
  end 
end
