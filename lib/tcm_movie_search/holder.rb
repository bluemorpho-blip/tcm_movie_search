# holder.rb is a working copy of scraper.rb
# here tempiorarily, in case I trash scraper.rb.

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
    attr_accessor :title, :description, :cast, :runtime, :link, :genre

    @site = "http://www.tcm.com/schedule/monthly.html?ecid=subnavmonthschedule"

    def self.data_scraper(url)
      Nokogiri::HTML(open(url))
      rescue OpenURI::HTTPError
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
       link = link[0].to_s

        if link.start_with?("http:")
          link
          genre = "#{link}genre.html"
          scrape_genre(title, description, cast, runtime, link, genre)
        else
          link = "no link available"
        end

        #if link.start_with?("http:")
          #scrape_genre(link)
        #else
          #genre = "inaccurate link"
        #end
      end
    end

    def self.scrape_genre(title, description, cast, runtime, link, genre)
      begin
        doc = data_scraper(genre)
        genre_even = doc.css("tr.tdrwodd")
      rescue
        genre = "no genre listed"
      end
        create_movie_obj(title, description, cast, runtime, link, genre_even)
    end

    def self.create_movie_obj(title, description, cast, runtime, link, genre)
      TcmMovieSearch::Movies.new(title, description, cast, runtime, link, genre)
    end

  end
