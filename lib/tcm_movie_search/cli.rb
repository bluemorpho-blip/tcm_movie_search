#!/usr/bin/env ruby

# TcmMovieSearch::CLI class will directly interact with the user

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
   end
   
   def Searcher
     puts "search using keyworrd, title, year released, actor, director, genre..."
     puts "search: "
     user_input = gets.strip
     
     case user_input
     when
  
end