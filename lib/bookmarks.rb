class BookMarks
  attr_reader :list

  def initialize(list = [])
    @list = list
  end

  def self.all
    return ['Google', 'Facebook', 'Youtube'] 
  end 
end