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

    result = connection.exec("INSERT INTO bookmarks(title, url) VALUES('#{title}', '#{url}') RETURNING id, url, title;")
    BookMark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
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
