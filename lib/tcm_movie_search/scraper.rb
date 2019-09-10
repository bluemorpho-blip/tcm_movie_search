class TcmMovieSearch::Scraper

  site = "http://www.tcm.com/schedule/monthly.html?ecid=subnavmonthschedule"

  movies = page.css("h2 a")
  description = page.css("p.description")
  link = page.css('h2 a').map { |link| link['href'] }
  genre = "#{link.first}genre.html"

  movie_genre = Nokogiri::HTML(open(genre))
  genre_even = movie_genre.css("tr.tdrwodd")
  genre_odd = movie_genre.css("tr.tdreven")
  title = movie_genre.css("span.db-movietitle")
  year = movie_genre.css("span.dbyear")
  # will remove the parentheses from the year to aid in search
  # clean_year = year.gsub(/[()]/, "")

  # scraper_test is used to follow the trail of passing
  # values through my classes
  def self.scraper_test
    puts "you have accessed the class TcmMovieSearch::Scraper!"
  end

  # final_destination is another test method for following values
  def self.final_destination(input)
    input = input + 4
    input
  end


  def self.scrape_movie_schedule
    scraper = Nokogiri::HTML(open(index_url))
    schedule = []


end
