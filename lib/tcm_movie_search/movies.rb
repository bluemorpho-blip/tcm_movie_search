class TcmMovieSearch::Movies

  attr_accessor :title, :description, :cast, :director, :year, :link

  @@all = []

  def initialize(title, description, cast, runtime)
    @title = title
    @description = description
    @cast = cast
    @runtime = runtime

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
