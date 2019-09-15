require 'nokogiri'
require 'open-uri'
# require 'httparty' # not seeing any difference btween HTTParty and open-uri
class Scraper
  attr_accessor :parse_page

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
  doc = Nokogiri::HTML(open(@site))

  def scraper
     movie_title = doc.css("h2 a")
     description = doc.css("p.description")
     link = doc.css('h2 a').map { |link| link['href'] }
     genre = "#{link.first}genre.html"

     doc.each.with_index do |data, index|
       if data.css("p.description").count != 0
         description = data.css("p.description")

         TcmMovieSearch::Movies.new(description)
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
