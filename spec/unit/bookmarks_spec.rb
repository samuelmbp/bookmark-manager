require 'bookmark'
require 'database_helper'

describe BookMark do

  describe '#all' do
    it 'returns the list with the bookmarks' do
      # Test Database
      connection = PG.connect(dbname: 'bookmark_manager_test')

      # Addind test data
      BookMark.create(url: 'http://www.makersacademy.com/', title: 'Makers Academy')
      BookMark.create(url: 'http://www.destroyallsoftware.com', title: 'Destroy All Software')
      BookMark.create(url: 'http://www.google.com/', title: 'Google')

      # Production database
      bookmarks = BookMark.all   
      expect(bookmarks.first).to be_a BookMark   
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com/'
    end
  end

  describe '#create' do
    it 'creates a new bookmark' do
        bookmark = BookMark.create(url: 'http://www.makersacademy.com/', title: 'Makers Academy')
        persisted_data = persisted_data(id: bookmark.id)

        expect(bookmark).to be_a BookMark
        expect(bookmark.id).to eq persisted_data['id']
        expect(bookmark.title).to eq 'Makers Academy'
        expect(bookmark.url).to eq 'http://www.makersacademy.com/'
    end
  end
end