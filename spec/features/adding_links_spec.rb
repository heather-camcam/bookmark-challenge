require 'web_helper'

feature 'Adding links' do
  scenario 'user sees added link' do
    create_bookmark
    click_button 'Submit'
    expect(page).to have_content('Useless Web')
  end
end
