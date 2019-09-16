class TcmMovieSearch::Movies

  attr_accessor :title, :description, :genre, :cast, :director, :year, :link, :genre_even

  @@all = []

  def initialize(title, description, cast, runtime, link, genre_even)
    @description = description
    @cast = cast
    @runtime = runtime
    @title = title
    @link = link
    @genre_even = genre_even
    save
  end

  def save
    @@all << self
  end

  def self.all
    TcmMovieSearch::Scraper.scraper if @@all.empty?
    @@all.inspect

  end


end
