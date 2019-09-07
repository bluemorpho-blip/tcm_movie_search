#!/usr/bin/env ruby

class TcmMovieSearch::MovieSearch
  
  def self.movie_search_test
    puts "you have accessed the class TcmMovieSearch::MovieSearch!"
  end
  
  def self.pass_to_next_class
    TcmMovieSearch::Scraper.final_destination
  end
  
end