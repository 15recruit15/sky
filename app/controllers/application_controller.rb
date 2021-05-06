class ApplicationController < ActionController::Base
    include SessionsHelper
  #ビューでは全てのヘルパーが使えるが、コントローラーでは明示する必要がある。
  
     # ログイン済みユーザーかどうか確認
    def logged_in_user
      unless logged_in?
        flash[:danger] = "ログインしてください"
        redirect_to login_url
      end
    end  
end
