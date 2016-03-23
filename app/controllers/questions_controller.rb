class QuestionsController < ApplicationController
  def index
    @questions = Question.order(:created_at).paginate(:page => params[:page], :per_page => 3)
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.order(created_at: :asc).paginate(:page => params[:page], :per_page => 3)
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      flash[:notice] = "Question created!"
      redirect_to questions_path
    else
      flash[:alert] = "Question not created, please check your input."
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:notice] = "Question updated!"
      redirect_to question_path(@question)
    else
      flash[:alert] = "Question not updated, please check your input."
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @answers = @question.answers

    if @question.destroy!
      @answers.each do |answer|
        answer.destroy!
      end

      flash[:notice] = "Question deleted!"
    end
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(
      :title,
      :description
    )
  end
end
