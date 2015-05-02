require 'rails_helper'
include OmniauthHelper

feature 'Authentication', js: true do

  given!(:user) { FactoryGirl.create(:user, email: "kirill@gmail.com", password: "12345678") }

  scenario 'Visitor login successfully via sign in form' do
    visit '#/sign_in'

    fill_in 'Email', with: 'kirill@gmail.com'
    fill_in 'Password', with: '12345678'

    click_button 'Sign in'
    expect(page).not_to have_content 'Sign in'
    expect(page).to have_content 'Sign out'
  end

  scenario 'Visitor cant login if form with data undefined user' do
    visit '#/sign_in'

    fill_in 'Email', with: 'kirill@undefined.com'
    fill_in 'Password', with: '87654321'

    click_button 'Sign in'
    expect(page).to have_content 'Invalid email or password'
  end

  scenario 'Visitor sign in with facebook' do
    visit '#/sign_up'
    set_omniauth
    find('.sign-with-fb').click

    expect(page).to have_content 'Sign out'
  end
end