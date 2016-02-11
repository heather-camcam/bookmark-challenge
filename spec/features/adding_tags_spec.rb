require 'web_helper'
feature 'Adding tags to bookmark links' do
  scenario 'tag a single link' do
    create_bookmark
    fill_in('name', with: 'random')
    click_button 'Submit'
    expect(page).to have_content('random')
  end

  scenario 'add multiple tags to the same link.' do
    create_bookmark
    fill_in('name', with: 'random crazy offthescale')
    click_button 'Submit'
    link = Link.first
    expect(link.tags.map(&:name)).to include("random", "crazy", "offthescale")
  end
end
