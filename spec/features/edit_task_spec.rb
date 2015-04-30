require 'rails_helper'

feature 'Edit task', js: true do
  given(:user) { FactoryGirl.create(:user) }
  given(:list) { FactoryGirl.create(:list, user_id: user.id) }
  given!(:task) { FactoryGirl.create(:task, list_id: list.id) }

  before do
    login_as user
    visit root_path
  end

  scenario 'User rename task successfully with valid data' do
    find('.li-task').hover
    within('.task-change') do
      find('.glyphicon-edit').click
    end

    find('.form-edit-task').set('Change content')
    find('.glyphicon-ok').click

    expect(page).to have_content 'Change content'
  end


  scenario 'User set due date' do
    find('.li-task').hover
    within('.task-change') do
      find('.glyphicon-edit').click
    end

    find('.ui-datepicker-trigger').click
    first('.ui-state-default').click

    expect(page).to have_content 'Due date:'
  end
end