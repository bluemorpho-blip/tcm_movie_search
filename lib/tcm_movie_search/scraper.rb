class TcmMovieSearch::Scraper

  @site = "http://www.tcm.com/schedule/monthly.html?ecid=subnavmonthschedule"

  doc = Nokogiri::HTML(open(@site))

  movies = doc.css("h2 a")
  description = doc.css("p.description")
  link = doc.css('h2 a').map { |link| link['href'] }
  genre = "#{link.first}genre.html"

  movie_genre = Nokogiri::HTML(open(genre))
  genre_even = movie_genre.css("tr.tdrwodd")
  genre_odd = movie_genre.css("tr.tdreven")
  title = movie_genre.css("span.db-movietitle")
  year = movie_genre.css("span.dbyear")
  # will remove the parentheses from the year to aid in search
  # clean_year = year.gsub(/[()]/, "")

  def scrape_movies
    doc = Nokogiri::HTML(open(@site))
    puts doc
  end

  # final_destination is another test method for following values
  def self.final_destination(input)
    input = input + 4
    input
  end


  def self.scrape_movie_schedule
    scraper = Nokogiri::HTML(open(@site))
    schedule = {}
    schedule = {:test_title => "The Picture of Dorian Gray",
    :test_synopsis => "Brief Synopsis:
    A man remains young and handsome while his
    portrait shows the ravages of age and sin.
    (1945)",
    :test_year => "1945"}
    puts "\n#{schedule[:test_title]}\n#{schedule[:test_synopsis]}\n#{schedule[:test_year]}"
  end

end
