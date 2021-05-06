class TopsController < ApplicationController
  def home
    @questions = Question.all.page(params[:page]).per(10) 
  end
  
  def search
    @questions_searched = Question.search(params[:search]).page(params[:page]).per(10)
    @questions = Question.all.page(params[:page]).per(10) 
    render 'home'
  end 
end
