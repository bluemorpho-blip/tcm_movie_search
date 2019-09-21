class TcmMovieSearch::Movies

  attr_accessor :title
  @@all = []

  def initialize(title)
    @title = title
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
