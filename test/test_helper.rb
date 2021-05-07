ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
   include ApplicationHelper

  # Add more helper methods to be used by all tests here...
  
  def t_logged_in?
    !session[:user_id].nil?
  end
  
  def t_log_in(user)
    session[:user_id] = user.id
  end
  
end

  
  class ActionDispatch::IntegrationTest
    # テストユーザーとしてログインする。Integration用
    def t_log_in(user, password: 'password')
      post login_path, params: { session: { email: user.email,
                                          password: password }} 
    end
  end
