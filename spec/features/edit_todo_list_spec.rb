require 'rails_helper'

feature 'Edit todo list', js: true do
  given(:user) { FactoryGirl.create(:user) }
  given!(:list) { FactoryGirl.create(:list, user_id: user.id) }

  before do
    login_as user
    visit root_path
  end

  scenario 'User rename list successfully with valid data' do
    find('.glyphicon-edit').click
    find('.form-edit').set('Change name')
    find('.glyphicon-ok').click

    expect(page).to have_content 'Change name'
  end

  scenario 'User can not set empty name list' do
    # todo
  end

end