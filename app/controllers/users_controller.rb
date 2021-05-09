class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update,:destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user, only: :destory
  
  def show
    @user = User.find(params[:id])
    @questions = @user.questions.page(params[:page]).per(10)
  end
  
  def new
    @user = User.new
  end 
  
  def create
    @user = User.new(user_params)   
    @user.image.attach(params[:user][:image])
    if @user.save
      log_in @user 
      flash[:success] = "Welcome to Sky Quest!"
       redirect_to @user
       # @user = user_url(@user) = user_url(@user.id) = ("/users/#{user.id}") = showアクション
    else
      render 'new'
    end
  end
  
  def edit 
    @user = User.find(params[:id])
  end 
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)          
      flash[:success] = "プロフィールが更新されました"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destory
    flash[:success] = "ユーザーを削除しました"
    redirect_to root_url
  end   
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation,:image)
    end  
    
    
        # 正しいユーザーかどうか確認
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
    
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end 
    
    def logged_in_user
      unless logged_in?
        flash[:danger] = "ログインして下さい"
        redirect_to login_url
      end
    end
    
end
