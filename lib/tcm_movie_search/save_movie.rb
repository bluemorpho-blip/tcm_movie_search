class TcmMovieSearch::SaveMovie
  @@saved_list = []

  def self.saved_list
    @@saved_list
  end

  def self.save_movie
    puts "enter the index number of the movie to save:"
    puts "'".blue + "save" + "' to save your list".blue
    puts "'".blue + "exit" + "' when finished".blue
    user_input = gets.strip
    user_input = user_input.to_i
      if TcmMovieSearch::Movies.all.include?(TcmMovieSearch::Movies.all[user_input])
        @@saved_list << TcmMovieSearch::Movies.all[user_input]
      elsif
        user_input == "save"
        puts "movies saved!"
      elsif !TcmMovieSearch::Movies.all.include?(TcmMovieSearch::Movies.all[user_input])
        puts "no match found, please try again"
      elsif user_input == "exit"
      end
    return
  end

end
