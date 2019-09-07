#!/usr/bin/env ruby

class TcmMovieSearch::Scraper
  
  def self.scraper_test
    puts "you have accessed the class TcmMovieSearch::Scraper!"
  end
  
  def self.final_destination
    puts "you've traveled:"
    puts "CLI => MovieSearch"
    puts "MovieSearch => Scraper"
    puts "Scpraper => MovieSearch"
    puts "MovieSearch => CLI"
    puts " maybe, you're starting to get it. . . "
  end
  
end