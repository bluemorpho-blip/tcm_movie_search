class TcmMovieSearch::Search

 def self.search_menu
   puts "\nSearch Menu".underline
   puts "\nenter search word:\nor".blue
   puts "'".blue + "1" + "' to return to main menu".blue
   puts "'".blue + "2" + "' to exit application".blue
   keyword = gets.strip
   if keyword == "1"
     return
   elsif keyword == "2"
     exit
   elsif keyword == "" # can't search for whitespaces
     puts "invalid search entry"
     search_menu
   else
    search(keyword)
  end
  return
 end

 def self.search(keyword)
   puts "search results for ".blue + "#{keyword.underline}:"
    TcmMovieSearch::Movies.all.each.with_index do |data, index|
      if data.inspect.downcase.include?(keyword.downcase)
        # puts "search results for ".blue + "#{keyword.underline}:"
        puts "\nindex: #{index}\n" + "#{data.to_yaml}".blue
      end
    end
    TcmMovieSearch::SaveMovie.save_option
  end

end
