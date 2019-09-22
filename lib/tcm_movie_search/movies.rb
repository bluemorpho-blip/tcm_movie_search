class TcmMovieSearch::Movies

  attr_accessor :t, :date, :time, :title, :description, :cast, :runtime, :link, :year, :genre
  @@all = []

  def initialize(t, date, time, title, year, description, cast, runtime, link, genre)
    @t = t
    @date = date
    @time = time
    @title = title
    @description = description
    @cast = cast
    @runtime = runtime
    @link = link
    @year = year
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
