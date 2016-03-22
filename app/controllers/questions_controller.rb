class QuestionsController < ApplicationController
  def index
    @questions = Question.order('created_at DESC').paginate(:page => params[:page], :per_page => 3)
  end

  def show
    @question = Question.find(params[:id])
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
  end

  def update
  end

  def destroy
  end


  private

  def question_params
    params.require(:question).permit(
      :title,
      :description
    )
  end
end
