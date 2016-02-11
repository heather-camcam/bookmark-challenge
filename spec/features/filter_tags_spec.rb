require 'web_helper'

feature 'filter and view tags' do
  scenario 'filter links tagged bubbles' do
    create_bookmark
    fill_in('name', with: 'social')
    click_button 'Submit'
    visit '/tag/social'
    expect(page).to have_content('Useless Web')
  end
end
