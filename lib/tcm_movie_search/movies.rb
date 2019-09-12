class TcmMovieSearch::Movies

  @@all = {}

  def initialize(title)
    @title = title
    @description = description
    @genre = genre
    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end


end
