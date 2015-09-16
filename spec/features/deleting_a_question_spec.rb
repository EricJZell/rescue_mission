require 'rails_helper'

feature 'delete a question', %Q{
  As a user
  I want to delete a question
  So that I can delete duplicate questions

  Acceptance Criteria

  [] I must be able delete a question from the question edit page
  [] I must be able delete a question from the question details page
  [] All answers associated with the question must also be deleted
} do
  scenario 'user clicks the Delete link in the question edit page' do
    question = FactoryGirl.create(:question)
    answer = FactoryGirl.create(:answer, question_id: question.id)
    expect(Answer.where(question_id: question.id)).to match_array [answer]
    visit root_path
    click_link 'Edit'
    click_link 'Delete Question'
    expect(page).to have_no_content(question.title)
    expect(Answer.where(question_id: question.id)).to match_array []
  end

  scenario 'user clicks the Delete link in the question details page' do
    question = FactoryGirl.create(:question)
    answer = FactoryGirl.create(:answer, question_id: question.id)
    expect(Answer.where(question_id: question.id)).to match_array [answer]
    visit root_path
    click_link question.title
    click_link 'Delete Question'
    expect(page).to have_no_content(question.title)
    expect(Answer.where(question_id: question.id)).to match_array []
  end
end
