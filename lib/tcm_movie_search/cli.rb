class TcmMovieSearch::CLI
  attr_accessor :keyword

  # tcm_movie_search starts here
  def call
    month = Date.today.strftime("%B")
    year = Date.today.strftime("%Y")
    puts "\nTCM movie schedule and search"
    puts "for #{month} #{year}"
    menu_options
    list_options
    get_user_option
  end

  def menu_options
    @menu = ["search", "schedule", "return to menu", "exit application"]
  end

  def list_options
    puts "\nMain Menu".underline
    puts "\nChoose an option:"
    @menu.each.with_index(1) do |option, index|
      puts "#{index}." + " #{option}".blue
    end
  end

  def get_user_option
    # replace with case statement
    chosen_option = gets.strip.to_i
     case chosen_option
     when 1
       TcmMovieSearch::Search.search_menu
     when 2
       puts "gathering the movie schedule."
       puts "this can take a few minutes."
       puts "please wait."
       TcmMovieSearch::Movies.schedule
     when 3
       call
     when 4
       exit
     else
       puts "not a valid choice, please select again".blue
       puts "choice:".blue
       get_user_option
     end
     call
  end

  def get_movies
    TcmMovieSearch::Movies.all
    call
  end

  def get_schedule
      TcmMovieSearch::Movies.schedule
      call
    end

   def search_menu
     puts "Main Menu".underline
     puts "search:".blue
     keyword = gets.strip
     if keyword == "exit"
       call
     elsif keyword == "end"
       return
     elsif keyword == "" # can't search for whitespaces
     puts "invalid search entry"
     search_menu
     else
      search(keyword)
     end
     call
   end

   def search(keyword)
      TcmMovieSearch::Movies.all.each.with_index do |data, index|
        if data.inspect.downcase.include?(keyword.downcase)
          puts "search results for #{keyword.white.underline}:".blue
          puts "\n#{index}: #{data.to_yaml}".blue
        end
      end
    call
  end

 end
