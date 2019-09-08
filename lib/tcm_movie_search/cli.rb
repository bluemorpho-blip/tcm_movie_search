#!/usr/bin/env ruby

# TcmMovieSearch::CLI class will directly interact with the user
require_relative 'movie_search'
require_relative 'scraper'

class TcmMovieSearch::CLI

  # tcm_movie_search starts here
  def call
    puts "    +++++++++++++++                                                    +++++++++"
    puts "      +++++++++++++                                                   +++++++++"
    puts "        +++++++++++                                                  ++++++++"
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
    # start_up
    search
   end

   def start_up
     puts "CLI.start_up method: calls methods from the movie_search and scraper classes."
     TcmMovieSearch::MovieSearch.movie_search_test
     TcmMovieSearch::Scraper.scraper_test
     two_classes_for_return(10)
   end

   def two_classes_for_return(input)
     puts "returning from scraper is: #{TcmMovieSearch::MovieSearch.pass_to_next_class(input)}"
   end

   def search
     puts "search:"
     search = gets.strip.downcase
     case search
       when "dorian gray"
         search_results(search)
       when !"dorian gray"
         "no results found for #{search}."
       when "exit"
        # search @@all objects for matches
      end
    end

   def search_results(search)
     puts "search results for: #{search}"
     # heredoc:
     puts <<-DOC.gsub /^\s*/, ''
     Brief Synopsis:
     A man remains young and handsome while his
     portrait shows the ravages of age and sin.
     (1945)
     DOC
   end

 end
