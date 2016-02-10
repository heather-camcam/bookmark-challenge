require 'web_helper'
feature 'Adding tags to bookmark links' do
  scenario 'tag a single link' do
    create_bookmark
    fill_in('tag', with: 'random')
    click_button 'Submit'
    expect(page).to have_content('random')
  end
end
