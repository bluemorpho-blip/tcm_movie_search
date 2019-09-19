class TcmMovieSearch::Movies

  attr_accessor :title, :description, :cast, :director, :year, :link, :genre

  @@all = []

  def initialize(title, year, description, cast, runtime, link, genre)
    @title = title
    @year = year
    @description = description
    @cast = cast
    @runtime = runtime
    @link = link
    @genre = genre
    save
  end

  def save
    @@all << self
  end

  def self.all
    TcmMovieSearch::Scraper.scraper if @@all.empty?
    @@all.inspect.blue
  end

end
