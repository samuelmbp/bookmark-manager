require 'pg'

class BookMarks
  attr_reader :list

  def initialize(list = [])
    @list = list
  end

  def self.all(production_db='bookmark_manager')
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect( dbname: production_db )
    end

    result = connection.exec('SELECT * FROM bookmarks;')
    result.map { |bookmark| bookmark['url']}
  end
end
