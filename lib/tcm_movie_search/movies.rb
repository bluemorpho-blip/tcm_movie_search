class TcmMovieSearch::Movies

  attr_accessor :title, :description, :genre, :cast, :director, :year

  @@all = []

  def initialize(title = nil, description = "not available", cast = "not available", runtime = "not available", url = "no url available")
    @title = title
    @description = description
    @cast = cast
    @runtime = runtime
    @url = url
    # @genre = genre
    # @year = year
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
