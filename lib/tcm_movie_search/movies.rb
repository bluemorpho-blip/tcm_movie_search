class TcmMovieSearch::Movies

  attr_accessor :title, :description, :genre, :actor, :director, :year

  @@all = []

  def initialize(title)
    @title = title
    # @description = description
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
