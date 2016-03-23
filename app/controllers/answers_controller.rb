class AnswersController < ApplicationController

  def index
    @question = Question.find(params[:question_id])
    @answers =  @question.answers
  end

  def new
    @question = Question.find(params[:question_id])
    @answer =  Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answers = @question.answers.order(created_at: :asc)
    @answer = Answer.new(answer_params)
    @answer.question = @question

    if @answer.save
      flash[:notice] = 'Answer successfully submitted!'
      redirect_to question_path(@question)
    else
      flash[:alert] = "Answer was not saved, please check your input."
      render :'questions/show'
    end
  end

  private
    def answer_params
      params.require(:answer).permit(
      :description
      )
    end

end
