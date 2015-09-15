class AnswersController < ApplicationController

  def index
    @question = Question.find(params[:question_id])
    @answers = @question.answers
  end

  def show
    #@question = Question.find(params[:id])
    #@answer = Answer.new
  end

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params(@question))
    if @answer.save
      flash[:notice] = 'Answer added'
      redirect_to question_answers_path
    else
      flash[:notice] = @answer.errors.full_messages.join(', ')
      render :new
    end
  end

  protected
  def answer_params(question)
    {title: params[:answer][:title], body: params[:answer][:body], question: question}
  end

end
