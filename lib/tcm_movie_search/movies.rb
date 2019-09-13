class TcmMovieSearch::Movies

  attr_accessor :title, :description, :genre, :actor, :director, :year

  @@all = []

  def initialize(title, description = "no description available", genre = "movie", year = "no year available")
    @title = title
    @description = description
    @genre = genre
    @year = year
    save
  end

  def save
    @@all << self
  end

  def self.all
    TcmMovieSearch::Scraper.scrape_movies if @@all.empty?
    @@all
  end


end
