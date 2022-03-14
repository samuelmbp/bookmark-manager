feature 'Tests for the bookmarks page' do
  scenario 'User can view bookmarks' do
    visit '/bookmarks' 
    expect(page).to have_content 'Google'
    expect(page).to have_content 'Facebook'
    expect(page).to have_content 'Youtube'
  end
end