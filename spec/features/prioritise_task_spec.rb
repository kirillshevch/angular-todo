require 'rails_helper'

feature 'Edit prioritise task', js: true do
  given!(:user) { FactoryGirl.create(:user) }
  given!(:list) { FactoryGirl.create(:list, user_id: user.id) }
  given!(:task1) { FactoryGirl.create(:task, name: 'task1', list_id: list.id) }
  given!(:task2) { FactoryGirl.create(:task, name: 'task2', list_id: list.id) }
  given!(:task3) { FactoryGirl.create(:task, name: 'task3', list_id: list.id) }

  before do
    login_as user
    visit root_path
  end

  scenario 'User change priority task successfully' do
    el1 = all('.li-task').first
    el3 = all('.li-task').last
    el3.drag_to(el1)

    expect(page).to have_selector('.li-task:nth-child(1)', text: 'task3')
    expect(page).to have_selector('.li-task:nth-child(2)', text: 'task1')
    expect(page).to have_selector('.li-task:nth-child(3)', text: 'task2')
  end
end