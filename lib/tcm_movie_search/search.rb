class TcmMovieSearch::Search

     def self.search_menu
       puts "enter search word:\nor".blue
       puts "'1' to return to main menu".blue
       puts "'2' to exit application".blue
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

     def search(keyword)
        TcmMovieSearch::Movies.all.each.with_index do |data, index|
          if data.inspect.include?(keyword)
            puts "search results for #{keyword.white.underline}:".blue
            puts "\n#{index}: #{data.to_yaml}".blue
          end
        end
    end


end
