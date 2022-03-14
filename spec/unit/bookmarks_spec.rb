require 'bookmarks'
describe BookMarks do
  subject(:bookmarks) {described_class.new}
  
  describe '#new' do
    it 'returns an empty array' do
      expect(bookmarks.list).to eq []
    end
  end

  describe '#all' do
    it 'shows the hardcoded array' do
      expect(BookMarks.all).to eq (['Google', 'Facebook', 'Youtube'])
    end
  end
end