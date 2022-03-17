feature 'User can create a bookmark' do
  scenario 'create a bookmark' do
    visit '/' 
    click_link 'Create Bookmark'
    fill_in('title', with: 'Makers Academy')
    fill_in('url',  with: 'http://www.makersacademy.com/')
    click_button 'Add Bookmark'

    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com/')
  end
end