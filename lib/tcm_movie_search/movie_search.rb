#!/usr/bin/env ruby

class TcmMovieSearch::MovieSearch 
  
  def movie_search_tester(test_input)
    if test_input == "movie search class"
      "you went to the TcmMovieSearch::MovieSearch class"
    elsif test_input == "scraper"
      TcmMovieSearch::ScraperHolder.scraper(test_input)
    else
      "term not recognized in MovieSearch class"
    end
  end
end