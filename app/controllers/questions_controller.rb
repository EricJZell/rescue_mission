class QuestionsController < ApplicationController

  def index
    @questions = Question.all.order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = 'Question added'
      redirect_to '/questions'
    else
      flash[:notice] = @question.errors.full_messages.join(', ')
      render :new
    end
  end

  protected
  def question_params
    params.require(:question).permit(:title, :body)
  end

end
