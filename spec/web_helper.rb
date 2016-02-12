def create_bookmark
  visit '/'
  click_link 'Add link'
  fill_in('title', with: 'Useless Web')
  fill_in('url', with: 'http://theuselessweb.com/')
end

def create_account
  visit '/'
  click_link 'Create an account'
  fill_in('email', with: 'test@test.com')
  fill_in('password', with: 'qwerty')
  fill_in('password_confirmation', with: 'qwerty')
  click_button 'Submit'
end
