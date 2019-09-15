class TcmMovieSearch::Movies

  attr_accessor :title, :description, :genre, :actor, :director, :year

  @@all = []

  def initialize(title = "no title provided", description = "no description available", genre = "movie", year = "no year available")
    @title = title
    @description = description
    @genre = genre
    @year = year
    save
  end

  def save
    @@all << @title
  end

  def self.all
    TcmMovieSearch::Scraper.scraper if @@all.empty?
    @@all
  end


end
