require 'rails_helper'

feature 'view a questions answers', %Q{
As a user
I want to view the answers for a question
So that I can learn from the answer

Acceptance Criteria

[] I must be on the question detail page
[] I must only see answers to the question I'm viewing
[] I must see all answers listed in order, most recent last
} do
  scenario 'user navigates to a question details page' do
    question = FactoryGirl.create(:question)
    answer = FactoryGirl.create(:answer, question_id: question.id)
    visit '/'
    click_link question.title
    expect(page).to have_content(answer.title)
  end
end
