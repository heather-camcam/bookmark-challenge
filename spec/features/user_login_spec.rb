require 'web_helper'

feature 'user login' do

  scenario 'user count increases by 1 when user creates account' do
    expect{create_account}.to change(User, :count).by(1)
  end

  scenario 'redirects to welcome page after account creation' do
    create_account
    expect(page).to have_content 'Welcome test@test.com!'
  end

  scenario 'email address is stored in database' do
    create_account
    user = User.first
    expect(user.email).to eq("test@test.com")
  end

  scenario 'password matches confirmation password' do
    create_account_with_incorrect_password
    expect{click_button 'Submit'}.not_to change(User, :count)
  end

  scenario 'error message shown if password confirmation entered incorrectly' do
    create_account_with_incorrect_password
    click_button 'Submit'
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'user cannot sign up unless email address entered' do
    visit '/'
    click_link 'Create an account'
    fill_in('password', with: 'qwerty')
    fill_in('password_confirmation', with: 'qwerty')
    expect{click_button 'Submit'}.not_to change(User, :count)
  end

  scenario 'user cannot sign in with a duplicate email address' do
    create_account
    expect{create_account}.not_to change(User, :count)
    expect(page).to have_content 'Email is already taken'
  end
end
