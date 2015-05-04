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
# todo
  scenario 'User attach file successfully' do
    find('.li-task').hover
    find('.glyphicon-comment').click
    find('.glyphicon-paperclip').click
    attach_file('file-input', 'public/uploads/file_store/file/111/index8.jpeg')

    expect(page).to have_content 'Name:'
  end


end