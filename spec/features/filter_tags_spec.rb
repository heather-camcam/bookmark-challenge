require 'web_helper'

feature 'filter and view tags' do
  scenario 'filter links tagged bubbles' do
    create_bookmark
    fill_in('name', with: 'bubbles')
    click_button 'Submit'
    click_link 'bubbles'
    expect(page).to have_content('Useless Web')
  end
end
