require 'rails_helper'

feature 'Delete task', js: true do
  given(:user) { FactoryGirl.create(:user) }
  given(:list) { FactoryGirl.create(:list, user_id: user.id) }
  given!(:task) { FactoryGirl.create(:task, list_id: list.id) }

  before do
    login_as user
    visit root_path
  end

  scenario 'User delete task successfully' do
    expect(page).to have_content 'New task'

    find('.li-task').hover
    within('.task-change') do
      find('.glyphicon-trash').click
    end

    expect(page).not_to have_content 'New task'
  end
end