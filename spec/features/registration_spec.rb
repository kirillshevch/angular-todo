require 'rails_helper'
include OmniauthHelper

feature 'Registration', js: true do
  scenario 'Visitor registers successfully via sign up form' do
    visit '#/sign_up'

    fill_in 'Email', with: Faker::Internet.email
    fill_in 'Password', with: Faker::Internet.password(8)

    click_button 'Sign up'
    expect(page).not_to have_content 'Sign up'
    expect(page).to have_content 'Sign out'
  end

  scenario 'Visitor cant register if form empty' do
    visit '#/sign_up'

    fill_in 'Email', with: ''
    fill_in 'Password', with: ''

    click_button 'Sign up'
    expect(page).to have_content 'Invalid email'
    expect(page).to have_content 'Invalid password'
  end

  given!(:user) { FactoryGirl.create(:user, email: 'kirill@gmail.com') }

  scenario 'Visitor cant register if email has already been taken' do

    visit '#/sign_up'

    fill_in 'Email', with: 'kirill@gmail.com'
    fill_in 'Password', with: Faker::Internet.password(8)

    click_button 'Sign up'
    expect(page).to have_content 'Email has already been taken'
  end

  scenario 'Visitor sign up with facebook' do
    visit '#/sign_up'
    set_omniauth
    find('.sign-with-fb').click

    expect(page).to have_content 'Sign out'
  end

end