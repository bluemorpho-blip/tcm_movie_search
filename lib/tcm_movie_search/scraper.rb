

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

    def self.data_scraper(url)
      Nokogiri::HTML(open(url))
    end

    def self.scraper
      doc = data_scraper(@site)

      rows = doc.css("table tr")

      rows.each.with_index do |row, index|
        description = row.css("p.description").text.strip
        cast = row.css(".cast").text.strip
        runtime = row.css(".lastp").text.gsub(/[^\d]/, '').strip
        runtime.concat ' mins'
        title = rows[index - 1].css("a").text.gsub(/\([^()]*\)/, '').strip
        link = rows[index - 1].css("a").map { |link| link['href'] }
        link = link[0]

        if link != nil
          genre = data_scraper(link)
          genre = doc.css("tr.tdrwodd").text.strip
        end

        TcmMovieSearch::Movies.new(title, description, cast, runtime, link, genre = nil)
      end
    end

    def self.link_scraper(link)
        link  = "#{link}genre.html"
      #link = "http://www.tcm.com/tcmdb/title/309194/MGM-Parade-Show-25/genre.html"
      genre_doc = data_scraper(link)

      genre = doc.css("tr.tdrwodd").text.strip
    end
end
