class TcmMovieSearch::Scraper
  attr_accessor :title

  @site = "http://www.tcm.com/schedule/monthly.html?ecid=subnavmonthschedule"

  def initialize
    @title = title
  end

  def self.data_scraper(url)
    Nokogiri::HTML(open(url))
    rescue OpenURI::HTTPError
  end

  def self.scraper
    doc = data_scraper(@site)
    @title = doc.css("table tr")[6].text
      create_movie_obj
  end

  def self.create_movie_obj
    TcmMovieSearch::Movies.new(@title)
  end

end
