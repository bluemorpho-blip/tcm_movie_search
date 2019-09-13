class TcmMovieSearch::Scraper

  @site = "http://www.tcm.com/schedule/monthly.html?ecid=subnavmonthschedule"

  doc = Nokogiri::HTML(open(@site))

  movie_title = doc.css("h2 a")
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

  def scrape
    doc = Nokogiri::HTML(open(@site))

    movie_title = doc.css("h2 a")

    movies.each do |m|
      title = m.text
      TcmMovieSearch::Movies.new(title)
    end
  end

  def self.scrape_description(movie)
    TcmMovieSearch::Movies.new("Good movie", movie)
    TcmMovieSearch::Movies.new("Bad movie", movie)
  end
end
