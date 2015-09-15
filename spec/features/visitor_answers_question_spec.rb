require 'rails_helper'

feature 'answer a question', %Q{As a user
I want to answer another user's question
So that I can help them solve their problem

Acceptance Criteria

[] I must be on the question detail page
[] I must provide a description that is at least 50 characters long
[] I must be presented with errors if I fill out the form incorrectly
} do
  scenario 'user adds a valid answer' do
    answer = FactoryGirl.create(:answer)
    submit_answer(answer)
    expect(page).to have_content('Answer added')
    expect(page).to have_content(answer.title)
    expect(page).to have_content(answer.body)
  end

  scenario 'user adds an invalid answer' do
    answer = Answer.new(question_id: 1, body: 'Hello', title: 'World')
    submit_answer(answer)
    expect(page).to have_content('Title is too short')
    expect(page).to have_content('Body is too short')
  end
end

def submit_answer(answer)
  question = FactoryGirl.create(:question)
  visit '/'
  click_link question.title
  click_link 'Answers'
  click_link 'Post a new answer'
  fill_in 'Title', with: answer.title
  fill_in 'Body', with: answer.body
  click_button 'Add Answer'
end
