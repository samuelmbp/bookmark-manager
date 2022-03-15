require 'pg'

class BookMarks
  attr_reader :list

  def initialize(list = [])
    @list = list
  end

  def self.all
    conn = PG.connect( dbname: 'bookmark_manager' )
    result = conn.exec('SELECT * FROM bookmarks;')
    result.map { |bookmark| bookmark['url']}
  end 
end

# http://www.destroyallsoftware.com