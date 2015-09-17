require 'rails_helper'

feature 'post new question', %Q{As a user
I want to post a question
So that I can receive help from others

Acceptance Criteria

[x] I must provide a title that is at least 40 characters long
[x] I must provide a description that is at least 150 characters long
[x] I must be presented with errors if I fill out the form incorrectly
} do
  scenario 'user adds a valid question' do
    question = FactoryGirl.create(:question)
    visit '/questions/new'

    fill_in 'Title', with: question.title
    fill_in 'Body', with: question.body

    click_button 'Add Question'

    expect(page).to have_content('Question added')
    expect(page).to have_content(question.title)
  end

  scenario 'user adds an invalid question' do
    visit '/questions/new'
    fill_in 'Title', with: 'Hey-o'
    fill_in 'Body', with: 'What\'s the deal-io?'
    click_button 'Add Question'
    expect(page).to have_content('Title is too short')
    expect(page).to have_content('Body is too short')
  end
end
