require 'bookmarks'
describe BookMarks do
  subject(:bookmarks) {described_class.new}
  
  describe '#new' do
    it 'returns an empty array' do
      expect(bookmarks.list).to eq []
    end
  end

  describe '#all' do
    it 'returns the list with the bookmarks' do
      # Test DB
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks(url) VALUES('http://www.makersacademy.com/')")
      connection.exec("INSERT INTO bookmarks(url) VALUES('http://www.google.com/')")
      connection.exec("INSERT INTO bookmarks(url) VALUES('http://www.destroyallsoftware.com')")

      # Production DB
      bookmarks = BookMarks.all()
      
      expect(bookmarks).to include ('http://www.makersacademy.com/')
      expect(bookmarks).to include ('http://www.google.com/')
      expect(bookmarks).to include ('http://www.destroyallsoftware.com')
    end
  end
end