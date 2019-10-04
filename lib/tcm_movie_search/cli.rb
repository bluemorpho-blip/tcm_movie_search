class TcmMovieSearch::CLI

  # tcm_movie_search starts here
  def self.call
    schedule_date
    menu_options
    list_options
    get_user_option
  end

  def self.schedule_date
    month = Date.today.strftime("%B")
    year = Date.today.strftime("%Y")
    puts "\nTCM movie schedule and search"
    puts "for #{month} #{year}"
  end

  def self.menu_options
    @menu = ["search", "schedule", "return to menu", "saved movies", "exit application"]
  end

  def self.list_options
    puts "\nMain Menu".underline
    puts "\nChoose an option:"
    @menu.each.with_index(1) do |option, index|
      puts "#{index}." + " #{option}".blue
    end
  end

  def self.get_user_option
    # replace with case statement
    chosen_option = gets.strip.to_i
     case chosen_option
     when 1
       TcmMovieSearch::Search.search_menu
     when 2
       TcmMovieSearch::Movies.schedule
     when 3
       call
     when 4
       puts "saved movies:"
       puts TcmMovieSearch::SaveMovie.saved_list.to_yaml.blue
     when 5
       puts "Thanks for stopping by!".red
       puts ""
       exit
     else
       puts "not a valid choice, please select again".blue
       puts "choice:".blue
       get_user_option
     end
     self.call
  end

  def self.get_movies
    TcmMovieSearch::Movies.all
    self.call
  end

  def self.get_schedule
      TcmMovieSearch::Movies.schedule
      self.call
    end

 end
