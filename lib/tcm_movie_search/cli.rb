#!/usr/bin/env ruby

# TcmMovieSearch::CLI class will directly interact with the user
require_relative 'movie_search'
require_relative 'scraper'

class TcmMovieSearch::CLI
  
  # tcm_movie_search starts here
  def call
    puts "         ++++++++++                                                    +++++++++"
    puts "          +++++++++                                                   +++++++++"
    puts "          +++++++++                                                  ++++++++"
    puts "          +++++++++      @@@@@@@   @@@        @    @                +++++++"  
    puts "           ++++++++         @     @   @      @ @  @ @              ++++++"
    puts "            +++++++         @    @          @    @   @            +++++"
    puts "              +++++         @    @         @     @    @          ++++"
    puts "               ++++         @     @   @   @            @        +++"
    puts "                +++         @      @@@   @              @      ++"
    puts "                 ++                                           ++"
    puts "               __||__             TCM Movie Search          __||__"
    puts "______________|      |_____________________________________|      |_____________"
    puts ""
    # binding.pry 
    start_up
   end
   
   def start_up
     puts "CLI.start_up method: calls methods from the movie_search and scraper classes."
     TcmMovieSearch::MovieSearch.movie_search_test
     TcmMovieSearch::Scraper.scraper_test
     puts ""
     puts "now calling CLI.two_classes_for_return method:"
     puts "calling TcmMovieSearch::MovieSearch.pass_to_next_class"
     puts "which calls TcmMovieSearch::Scraper.final_destination"
     puts "which displays, from the 2nd class called (Scraper):"
     two_classes_for_return

   end
   
   def two_classes_for_return
     TcmMovieSearch::MovieSearch.pass_to_next_class
   end
     
   
     
 end