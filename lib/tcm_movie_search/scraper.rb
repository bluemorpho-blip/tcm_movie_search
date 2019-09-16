

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


      rows = doc.css("table tr")

      rows.each.with_index do |row, index|
        description = row.css("p.description").text.strip
        cast = row.css(".cast").text.strip
        runtime = row.css(".lastp").text.gsub(/[^\d]/, '').strip
        runtime.concat ' mins'
        title = rows[index - 1].css("a").text.gsub(/\([^()]*\)/, '').strip
        link = rows[index - 1].css('h2 a').map { |link| link['href'] }
        site = link

        title_scraper(link)

        TcmMovieSearch::Movies.new(title, description, cast, runtime, link, genre_even)
      end
    end

    def self.title_scraper(link)

      movie_genre = link.to_s

      genre_even = movie_genre.css("tr.tdrwodd")
      genre_odd = movie_genre.css("tr.tdreven")
      title = movie_genre.css("span.db-movietitle")
      year = movie_genre.css("span.dbyear")


    end

  end
