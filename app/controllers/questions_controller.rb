class QuestionsController < ApplicationController
  def index
    @questions = Question.order(:created_at).paginate(:page => params[:page], :per_page => 3)
  end

  def show
    @question = Question.find(params[:id])
  end
end
