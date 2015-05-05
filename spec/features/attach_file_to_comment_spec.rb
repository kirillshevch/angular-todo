require 'rails_helper'

feature 'Attach file', js: true do
  given(:user) { FactoryGirl.create(:user) }
  given(:list) { FactoryGirl.create(:list, user_id: user.id) }
  given(:task) { FactoryGirl.create(:task, list_id: list.id) }
  given!(:comment) { FactoryGirl.create(:comment, task_id: task.id) }

  before do
    login_as user
    visit root_path
  end

  scenario 'User attach file successfully' do
    find('.li-task').hover
    find('.glyphicon-comment').click
    find('.glyphicon-paperclip').click
    attach_file('file-input', File.expand_path('spec/support/unnamed.png'))

    expect(page).to have_content 'Name: unnamed.png'

    click_button 'upload'

    expect(page).to have_content 'unnamed.png'
  end

  scenario 'User cannot attach file is too big (at most 15 mb)' do
    find('.li-task').hover
    find('.glyphicon-comment').click
    find('.glyphicon-paperclip').click
    attach_file('file-input', File.expand_path('spec/support/bigfile.test'))
    click_button 'upload'

    expect(page).to have_content 'File is too big (should be at most 15 MB)'
  end

end