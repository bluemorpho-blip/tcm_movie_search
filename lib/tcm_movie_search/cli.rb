# TcmMovieSearch::CLI class will directly interact with the user
class TcmMovieSearch::CLI
  attr_accessor :keyword

  # tcm_movie_search starts here
  def call
    puts "\nTCM movie schedule and search"
    puts ""
    menu_options
    list_options
    get_user_option
  end

  def get_movies
    TcmMovieSearch::Movies.all
    call
  end

  def menu_options
    @menu = ["search", "schedule", "scraper test", "return to menu", "exit application",]
  end

  def list_options
    puts "\nChoose an option:".blue
    @menu.each.with_index(1) do |option, index|
      puts "#{index}. #{option}".blue
    end
  end

  def get_user_option
    # replace with case statement
    chosen_option = gets.strip.to_i
     case chosen_option
     when 1
       search_menu
     when 2
       puts "gathering the movie schedule."
       puts "this can take a few minutes."
       puts "please wait."
       get_schedule
     when 3
       get_scraped_movie
     when 4
       call
     when 5
       exit
     else
       puts "not a valid choice, please select again".blue
       puts "choice:".blue
       get_user_option
     end
  end

  def get_schedule
      TcmMovieSearch::Movies.schedule
      call
    end

   def search_menu
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
     if TcmMovieSearch::Movies.all.to_s.include?(keyword)
        puts "keyword found!"
      else
        puts "no match"
      end
    call
  end

   def get_scraped_movie # test
     scrape_box = []
     scrape_box << TcmMovieSearch::Scraper.scrape.text.gsub(/\([^()]*\)/, '') # removes the date
     puts scrape_box
     call
   end


 end
