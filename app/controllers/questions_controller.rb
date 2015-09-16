class QuestionsController < ApplicationController

  def index
    @questions = Question.all.order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
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
      flash[:error] = @question.errors.full_messages.join(', ')
      render :new
    end
  end

  def destroy
    Question.find(params[:id]).destroy
    redirect_to questions_path
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:notice] = 'Question Updated!'
      redirect_to @question
    else
      flash[:error] = @question.errors.full_messages.join(', ')
      render :edit
    end
  end

  protected
  def question_params
    params.require(:question).permit(:title, :body)
  end

end
