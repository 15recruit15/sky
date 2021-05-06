module SessionsHelper
  
    # 渡されたユーザーでログインする
  def log_in(user)
    #sessionメソッドで一時的なCookiesを作成する。
    #これは暗号化されているため、盗まれても問題ない。
    session[:user_id] = user.id
  end
  

  # 現在ログイン中のユーザーを返す, いない場合nilを返す
  def current_user
    if session[:user_id]
      #@current_userがnilの場合のみ、find_byが呼び出される.
      #結果的にデータベースへの接続を最初の一回のみに出来る。
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end
  
    # 渡されたユーザーがカレントユーザーであればtrueを返す
  def current_user?(user)
    user && user == current_user
  end
  
   # ユーザーがログインしていればtrue、その他ならfalseを返す
  def logged_in?
    !current_user.nil?
  end
  
    # 現在のユーザーをログアウトする
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
  
end
