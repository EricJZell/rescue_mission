require 'rails_helper'

feature 'view question details', %Q{As a user
I want to view a question's details
So that I can effectively understand the question

Acceptance Criteria

[] I must be able to get to this page from the questions index
[] I must see the question's title
[] I must see the question's description
} do
  scenario 'visitor navigates to question details' do
    q1 = Question.create(user_id: 1, title: 'Why', body: 'this is the description')
    q2 = Question.create(user_id: 1, title: 'When')
    q3 = Question.create(user_id: 1, title: 'Recent')
    visit '/'
    click_link(q1.title)
    expect(page).to have_content(q1.body)
    expect(page).to have_content(q1.title)
  end
end
