class TopsController < ApplicationController
  def home
    @questions = Question.all.page(params[:page]).per(6) 
  end
  
  def search
    @questions_searched = Question.search(params[:search]).page(params[:page]).per(6)
    @questions = Question.all.page(params[:page]).per(6) 
    render 'home'
  end 
end
