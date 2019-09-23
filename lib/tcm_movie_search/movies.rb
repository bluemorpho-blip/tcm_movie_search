class TcmMovieSearch::Movies

  attr_accessor :date, :time, :title, :description,
                :cast, :runtime, :link, :year,
                :year_released, :genre, :genre_1,
                :genre_2
  @@all = []

  def initialize(date, time, title, year_released, description, cast, runtime, link, genre_1, genre_2)
    @date = date
    @time = time
    @title = title
    @description = description
    @cast = cast
    @runtime = runtime
    @link = link
    @year_released = year_released
    @genre_1 = genre_1
    @genre_2 = genre_2
    save
  end

  def save
    @@all << self
  end

  def self.all
    TcmMovieSearch::Scraper.scraper if @@all.empty?
    @@all
  end

  def self.schedule
    @@all.each do |element|
      puts element.to_yaml.blue
      # YAML Aint Markup Language - provides pretty
      # formatting for output
    end
  end

end
