require 'pg'

class BookMark
  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all(production_db='bookmark_manager')
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect( dbname: production_db )
    end

    result = connection.exec('SELECT * FROM bookmarks;')
    result.map { |bookmark| BookMark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url']) }
  end

  def self.create(url:, title:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect( dbname: 'bookmark_manager' )
    end
    
    result = connection.exec_params(
      "INSERT INTO bookmarks (url, title) VALUES($1, $2) RETURNING id, title, url;", [url, title]
    )
    BookMark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.delete(title:) 
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect( dbname: 'bookmark_manager' )
    end

    connection.exec_params("DELETE FROM bookmarks WHERE title = $1;", [title])
  end

  # private

  # def database_connection(production_db)
  #   if ENV['ENVIRONMENT'] == 'test'
  #     return PG.connect(dbname: 'bookmark_manager_test')
  #   else
  #     return PG.connect( dbname: production_db )
  #   end
  # end
end
