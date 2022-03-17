# feature 'View bookmarks' do
#   scenario 'User can see bookmarks' do
#     # Test db bookmarks
#     BookMark.create(url: 'http://www.makersacademy.com/', title: 'Makers Academy')
#     BookMark.create(url: 'http://www.google.com/', title: 'Google')
#     BookMark.create(url: 'http://www.destroyallsoftware.com', title: 'Destroy All Software')
    
#     # Production db bookmarks
#     visit '/bookmarks'
#     expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
#     expect(page).to have_link('Google', href: 'http://www.google.com')
#     expect(page).to have_link('Destroy All Software', href: 'http://www.destroyallsoftware.com')
#   end
# end