feature 'Delete bookmarks' do
  scenario 'Delete a bookmark' do
    visit '/'

    #create bookmark test to setup a bookmark
    click_link 'Create Bookmark'
    fill_in('title', with: 'Makers Academy')
    fill_in('url',  with: 'http://www.makersacademy.com/')
    click_button 'Add Bookmark'
    expect(page).to has_link?('Makers Academy', href: 'http://www.makersacademy.com/')

    #deleting the bookmark created by create bookmark
    fill_in 'title', with: 'Makers Academy'
    click_button 'Delete Bookmark'
    expect(page).to has_no_link?('Makers Academy', href: 'http://www.makersacademy.com/')
  end
end