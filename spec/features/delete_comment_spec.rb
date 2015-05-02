require 'rails_helper'

feature 'Delete comment', js: true do
  given(:user) { FactoryGirl.create(:user) }
  given(:list) { FactoryGirl.create(:list, user_id: user.id) }
  given(:task) { FactoryGirl.create(:task, list_id: list.id) }
  given!(:comment) { FactoryGirl.create(:comment, task_id: task.id) }

  before do
    login_as user
    visit root_path
  end

  scenario 'User delete comment successfully' do

    find('.li-task').hover
    find('.glyphicon-comment').click
    expect(page).to have_content 'New comment'
    within('.comments-list') do
      find('.glyphicon-trash').click
    end

    expect(page).not_to have_content 'New comment'
  end
end