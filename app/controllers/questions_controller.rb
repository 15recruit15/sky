class QuestionsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy,:new]
  before_action :correct_user,   only: :destroy

  def create
    @question = current_user.questions.build(question_params)
    @question.image.attach(params[:question][:image])
    if @question.save
      flash[:success] = "投稿されました"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def destroy
    @question.destroy
    flash[:success] = "投稿が削除されました"
    redirect_to user_path(@question.user.id)
  end
  
  def new
    @question = current_user.questions.build if logged_in?
  end 
  
  def show
    @question = Question.find(params[:id])
  end 
  


  private

    def question_params
      params.require(:question).permit(:content,:image,:title)
    end
    
    def correct_user
      @question = current_user.questions.find_by(id: params[:id])
      redirect_to user_path(@question.user.id) if @question.nil?
    end
end
