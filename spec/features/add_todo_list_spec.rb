require 'rails_helper'

feature 'Add todo list', js: true do
  given(:user) { FactoryGirl.create(:user) }

  before do
    login_as user

    visit root_path
  end

  scenario 'An user creates new todo list successfully' do
    find('.add-todo-list').click
    expect(page).to have_content('New list')
  end
end