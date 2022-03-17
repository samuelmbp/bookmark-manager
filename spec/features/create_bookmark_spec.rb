feature 'User can add a bookmark' do
  scenario 'add a bookmark' do
    visit '/' 
    fill_in('title', with: 'Makers Academy')
    fill_in('url',  with: 'http://www.makersacademy.com/')
    click_button 'Add Bookmark'

    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com/')
  end
end