class TcmMovieSearch::Movies

  attr_accessor :title, :description, :genre, :cast, :director, :year, :link

  @@all = []

  def initialize(title, description, cast, runtime, link)
    @description = description
    @cast = cast
    @runtime = runtime
    @title = title
    @link = link
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
