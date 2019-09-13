# TcmMovieSearch::CLI class will directly interact with the user
class TcmMovieSearch::CLI

  # tcm_movie_search starts here
  def call
    puts "\nTCM movie schedule and search"
    puts ""
    # get_movies
    # TcmMovieSearch::Scraper.scraper
    menu_options
    list_options
    get_user_option
  end

  # get_movie_schedule
  # display_scedule?
  # search_schedule?

  def get_movies
    # TcmMovieSearch::Movies.new("Night of the Hunter", "Robert Mitchum sucks in his belly!", "Suspense", "1948")
    # TcmMovieSearch::Movies.new("The Picture of Dorian Gray")
    puts "schedule:"
    puts TcmMovieSearch::Movies.all
    call
  end

  def menu_options
    @menu = ["search", "schedule", "return to menu", "exit application"]
  end

  def list_options
    puts "\nChoose an option:"
    @menu.each.with_index(1) do |option, index|
      puts "#{index}. #{option}"
    end
  end

  def get_user_option
    # replace with case statement
    chosen_option = gets.strip.to_i
     case chosen_option
     when 1
       search
     when 2
       get_movies
     when 3
       call
     when 4
       exit
     else
       puts "not a valid choice, please select again"
       puts "choice:"
       get_user_option
     end
  end

  def get_movie_schedule
    TcmMovieSearch::Movies.all
    #@schedule = ['current_month']
    call
  end

   def search
     puts "search:"
     search = gets.strip.downcase
     if search == "exit"
       call
     elsif search == "end"
       return
     elsif search == "" # can't search for whitespaces
     puts "invalid search entry"
     return search
     else
      search_results(search)
     end
     call
   end

   def search_results(search)
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
   end

 end
