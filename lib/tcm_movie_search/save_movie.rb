class TcmMovieSearch::SaveMovie
  @@saved_list = []

  def self.saved_list
    @@saved_list
  end

  def self.save_a_movie
    puts "Save movie?\n 'y' or 'n'"
    user_choice = gets.strip
    case user_choice.downcase
    when 'y' || 'yes'
      TcmMovieSearch::SaveMovie.save_movie
    else
      return
    end
  end

  def self.save_movie
    puts "enter the index number of the movie to save:"
    puts "'".blue + "exit" + "' when finished".blue
    user_input = gets.strip
    if user_input == "exit"
      movie_file
    elsif TcmMovieSearch::Movies.all.include?(TcmMovieSearch::Movies.all[user_input.to_i])
      @@saved_list << TcmMovieSearch::Movies.all[user_input.to_i]
      puts "saved!"
      save_movie
    elsif !TcmMovieSearch::Movies.all.include?(TcmMovieSearch::Movies.all[user_input.to_i])
      puts "no match found, please try again"
      save_movie
    end
    #Tcm::Search.search_menu
  end

  def self.movie_file
    puts "'".blue + "1" + "' to save your movie list in a file".blue
    puts "'".blue + "2" + "' to view your movie list".blue
    puts "'".blue + "3" + "' to exit".blue

    chosen_option = gets.strip.to_i
     case chosen_option
     when 1
       f = File.new('movies.txt', 'w')
       f.write(@@saved_list.to_yaml)
       f.close
     when 2
       puts @@saved_list.to_yaml.blue
       return
     when 3
       save_a_movie
     else
       puts "not a valid choice, please select again".blue
       puts "choice:".blue
       movie_file
     end
     save_a_movie
  end

end
