require 'rails_helper'

feature 'Add task', js: true do
  given(:user) { FactoryGirl.create(:user) }
  given!(:list) { FactoryGirl.create(:list, user_id: user.id) }

  before do
    login_as user
    visit root_path
  end

  scenario 'User add task successfully with valid data' do
    fill_in 'Start typing here to create a task...', with: 'New task'
    click_button 'Add Task'
    expect(page).to have_content 'New task'
  end

  scenario 'User cannot add task with invalid data' do
    fill_in 'Start typing here to create a task...', with: ''
    click_button 'Add Task'
    expect(page).to have_content 'Task can\'t be blank'
  end

end