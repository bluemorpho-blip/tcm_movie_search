  class TcmMovieSearch::Scraper
    attr_accessor :title, :description, :cast, :runtime, :link, :year, :genre

    @site = "http://www.tcm.com/schedule/monthly.html?ecid=subnavmonthschedule"

    def initialize
      @title = title
      @description = description
      @cast = cast
      @runtime - runtime
      @link = link
      @year = year
      @genre = genre
    end

    def self.data_scraper(url)
      Nokogiri::HTML(open(url))
      rescue OpenURI::HTTPError
    end

    def self.scraper
      doc = data_scraper(@site)
      rows = doc.css("table tr")

      rows.each.with_index do |row, index|
        @description = row.css("p.description").text.strip
        @cast = row.css(".cast").text.strip
        @runtime = row.css(".lastp").text.gsub(/[^\d]/, '').strip
        @runtime.concat ' mins'
        @title = rows[index - 1].css("a").text.gsub(/\([^()]*\)/, '').strip
        @link = rows[index - 1].css("a").map { |link| link['href'] }
        @link = @link[0].to_s

        if @link.start_with?("http:")
          @link
          @genre = "#{@link}genre.html"
          scrape_genre(@genre)
        else
          @link = "no link available"
        end
      end
    end

    def self.scrape_genre(genre)
      begin
        doc = data_scraper(@genre)
        @genre = doc.css("tr.tdrwodd").text.gsub(/\n/, '').strip
        @year = doc.css("span.dbyear").text.gsub(/[()]/, '').strip
        rescue
        @genre = "no genre listed"
      end
        create_movie_obj
    end

    def self.create_movie_obj
      TcmMovieSearch::Movies.new(@title, @year, @description, @cast, @runtime, @link, @genre)
    end

  end
