def create_bookmark
  visit '/'
  click_link 'Add link'
  fill_in('title', with: 'Useless Web')
  fill_in('url', with: 'http://theuselessweb.com/')
end
