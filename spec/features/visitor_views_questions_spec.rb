require 'rails_helper'

feature 'view questions', %Q{As a user
I want to view recently posted questions
So that I can help others

Acceptance Criteria

[x] I must see the title of each question
[x] I must see questions listed in order, most recently posted first
} do
  scenario 'visitor goes to root path' do
    q1 = Question.create(user_id: 1, title: 'Why')
    q2 = Question.create(user_id: 1, title: 'When')
    q3 = Question.create(user_id: 1, title: 'Recent')
    visit '/'
    expect(page).to have_content(q1.title)
    expect(page).to have_content(q2.title)
    expect(page).to have_content(q3.title)
    within "li:first" do
      page.should have_content q3.title
    end
  end

end
