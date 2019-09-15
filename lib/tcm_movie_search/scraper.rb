class TcmMovieSearch::Scraper

  # doc = "http://www.tcm.com/schedule/monthly.html?ecid=subnavmonthschedule"

  # @parse_page ||= Nokogiri::HTML(doc) # ||= if @parse_page doesn't equal Nokogiri::HTML(doc), it will.

  # movie_title = doc.css("h2 a")
  # description = doc.css("p.description")
  # link = doc.css('h2 a').map { |link| link['href'] }
  # genre = "#{link.first}genre.html"

  # movie_genre = Nokogiri::HTML(open(genre))
  # genre_even = movie_genre.css("tr.tdrwodd")
  # genre_odd = movie_genre.css("tr.tdreven")
  # title = movie_genre.css("span.db-movietitle")
  # year = movie_genre.css("span.dbyear")
  # will remove the parentheses from the year to aid in search
  # clean_year = year.gsub(/[()]/, "")

  @site = "http://www.tcm.com/schedule/monthly.html?ecid=subnavmonthschedule"

  def self.scraper
    doc = Nokogiri::HTML(open(@site))
     title = doc.css("h2 a")
     description = doc.css("p.description")
     link = doc.css('h2 a').map { |link| link['href'] }
     genre = "#{link.first}genre.html"



         TcmMovieSearch::Movies.new(title)


   end

  # scraper = Scraper.new
  # titles = scraper.get_movie_titles
  # descriptions = scraper.get_movie_description
  # links = scraper.get_movie_link

  # (0...titles.size).each do |index| # three dots don't include last digit. 0 to titles - 1
    # puts "\n- - - index: #{index + 1} - - -"
    # puts "\ntitle: #{titles[index].text.gsub(/\([^()]*\)/, '')}"
    # puts "\nbrief synposis:#{descriptions[index].text}"
    # puts "\nmovie link: #{links[index]}"
  # end

end
