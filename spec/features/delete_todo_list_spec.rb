require 'rails_helper'

feature 'Delete todo list', js: true do
  given(:user) { FactoryGirl.create(:user) }
  given!(:list) { FactoryGirl.create(:list, user_id: user.id) }

  before do
    login_as user
    visit root_path
  end

  scenario 'User delete list successfully' do
    find('.glyphicon-trash').click

    expect(page).not_to have_content('New list')
  end
end