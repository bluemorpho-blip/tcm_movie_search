class TcmMovieSearch::MovieTitleScraper

  def self.movie_title_scraper(link)

    genre_even = movie_genre.css("tr.tdrwodd")
    genre_odd = movie_genre.css("tr.tdreven")
    title = movie_genre.css("span.db-movietitle")
    year = movie_genre.css("span.dbyear")
  end

end
