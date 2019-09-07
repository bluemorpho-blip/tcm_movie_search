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
     TcmMovieSearch::MovieSearch.movie_search_test
     TcmMovieSearch::Scraper.scraper_test
     puts ""
     two_classes_for_return
   end
   
   def two_classes_for_return
     TcmMovieSearch::MovieSearch.pass_to_next_class
   end
     
   
     
 end