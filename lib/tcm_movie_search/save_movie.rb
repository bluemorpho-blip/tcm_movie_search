class TcmMovieSearch::SaveMovie
  @saved_list = []

  def self.save_movie
    puts "enter the index number of the movie to save:"
    puts "'".blue + "save" + "' to save your list".blue
    user_input = gets.strip
    TcmMovieSearch::Search.search_results.each do |index, data|
      if user_input.to_i == index
        @saved_list << data
      elsif
        user_input == "save"
        puts "movies saved!"
        return
      else
        puts "no match found, please try again"
      end
        save_movie
      end
      return
  end


end
