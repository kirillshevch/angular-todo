require 'rails_helper'

feature 'Add comment', js: true do
  given(:user) { FactoryGirl.create(:user) }
  given(:list) { FactoryGirl.create(:list, user_id: user.id) }
  given!(:task) { FactoryGirl.create(:task, list_id: list.id) }

  before do
    login_as user
    visit root_path
  end

  scenario 'User add comment to task successfully with valid data' do
    find('.li-task').hover
    within('.task-change') do
      find('.glyphicon-comment').click
    end

    fill_in 'Start typing here to create a comment...', with: 'New comment'
    find('.comment-add').click

    expect(page).to have_content 'New comment'
  end

  scenario 'User cannot add comment with invalid data' do
    find('.li-task').hover
    within('.task-change') do
      find('.glyphicon-comment').click
    end

    fill_in 'Start typing here to create a comment...', with: ''
    find('.comment-add').click

    expect(page).to have_content 'Comment can\'t be blank'
  end
end