

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
  class TcmMovieSearch::Scraper
    attr_accessor :title

    @site = "http://www.tcm.com/schedule/monthly.html?ecid=subnavmonthschedule"

    def self.scraper
      doc = Nokogiri::HTML(open(@site))

      doc.css("table tr").each do |data|
        title = data.css("a").text.gsub(/\([^()]*\)/, '').strip
        description = data.css("p.description").text.strip
      # end
        TcmMovieSearch::Movies.new(title, description)
      end
    end
  end
