require 'rails_helper'

feature 'edit a question', %Q{
As a user
I want to edit a question
So that I can correct any mistakes or add updates

Acceptance Criteria

[] I must provide valid information
[] I must be presented with errors if I fill out the form incorrectly
[] I must be able to get to the edit page from the question details page
} do
  scenario 'user fills out a valid edit question form' do
    question = FactoryGirl.create(:question)
    visit root_path
    click_link 'Edit'
    expect(page).to have_content('Edit Question')
    fill_in 'Title', with: ('Yo, homie...' + question.title)
    fill_in 'Body', with: ('Check it out...' + question.body)
    click_button 'Edit Question'
    expect(page).to have_content('Question Updated!')
    expect(page).to have_content('Check it out...' + question.body)
  end

  scenario 'user fills out an invalid edit question form' do
    question = FactoryGirl.create(:question)
    visit root_path
    click_link 'Edit'
    expect(page).to have_content('Edit Question')
    fill_in 'Title', with: ('Whyyyy?')
    fill_in 'Body', with: ('Ok, check it out...')
    click_button 'Edit Question'
    expect(page).to have_content('Title is too short')
    expect(page).to have_content('Body is too short')
    expect(page).to have_content('Edit Question')
  end
end
