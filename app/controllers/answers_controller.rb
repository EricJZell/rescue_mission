class AnswersController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params(@question))
    if @answer.save
      flash[:notice] = 'Answer added'
    else
      flash[:error] = @answer.errors.full_messages.join(', ')
    end
    redirect_to question_path(@question.id)
  end

  def update
    @answer = Answer.find(params[:id])
    @question = @answer.question
    @question.answers.each do |answer|
      answer.update(best: false)
    end
    @answer.update(best: true)
    redirect_to @question
    #binding.pry
  end

  protected
  def answer_params(question)
    {title: params[:answer][:title], body: params[:answer][:body], question: question}
  end

end
