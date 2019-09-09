# TcmMovieSearch::CLI class will directly interact with the user

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
    # start_up - Test method to follow method calls thru the classes
    # search - not a surgical strike
    search_2 # - searches by ANY keyword - so far, my favorite
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

# search and search_results go together
   def search
     puts "search:"
     search = gets.strip.downcase
    if search == "dorian gray"
         search_results(search)
    elsif search == "exit"
         puts "you chose 'exit'"
        return
    elsif search != "exit" || search != "dorian gray"
        # puts "no results found for #{search}."
        # search @@all objects for matches
        puts "not found"
      end
      self.search
    end

   def search_results(search)
     synopsis = "Brief Synopsis:
     A man remains young and handsome while his
     portrait shows the ravages of age and sin.
     (1945)"
     puts "search results for: #{search}"
     puts synopsis.gsub /^\s*/, ''
     
     # heredoc:
     # puts <<-DOC.gsub /^\s*/, ''
     # Brief Synopsis:
     # A man remains young and handsome while his
     # portrait shows the ravages of age and sin.
     # (1945)
     # DOC
   end
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

   
   # +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   # search_2 and Search_results_2 will give a much broader
   # return on a search.
   # need to make it work searching ALL values contained in an
   # object WITH THE RETURN VALUE BEING THE TITLE AND DESCRIPTION!!!!!
   # +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   def search_2
     puts "search:"
     search = gets.strip.downcase
     if search == "exit"
       return 
     elsif search == "" # can't search for whitespaces
     puts "invalid search entry"
     return self.search_2
     else
      search_results_2(search)
    end
   end
   
   def search_results_2(search)
     title = "The Picture of Dorian Gray"
     synopsis = "Brief Synopsis:
     A man remains young and handsome while his
     portrait shows the ravages of age and sin.
     (1945)"
     if (synopsis.downcase.include?(search) || title.downcase.include?(search))
       puts title
       puts synopsis
     else
       puts "no results found."
     end
     self.search_2
   end
   
 end
