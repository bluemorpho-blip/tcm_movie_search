class TcmMovieSearch::Scraper

  SITE = "http://www.tcm.com/schedule/monthly.html?ecid=subnavmonthschedule"

  def self.data_scraper(url)
    Nokogiri::HTML(open(url))
    rescue OpenURI::HTTPError
  end

  def self.scraper
    puts "loading TCM movie schedule".red
    puts "please wait\n".red


    doc = data_scraper(SITE)
    @count = 0

    rows = doc.css("table tr")
    rows.each.with_index do |row, index|
        printf("\rmovies scanned: #{@count.to_i}".green)
      @description = row.css("p.description").text.strip
      @cast = row.css(".cast").text.strip
      @runtime = row.css("td .lastp").text.gsub(/[^\d]/, '').strip
      @runtime.concat ' mins'
      @time = rows[index - 1].css("h1.nws-date").text.strip
      @title = rows[index - 1].css("a").text.gsub(/\([^()]*\)/, '').strip
      @link = rows[index - 1].css("a").map { |link| link['href'] }
      @link = @link[0].to_s

      if @link.start_with?("http:")
        @link
        @genre = "#{@link}genre.html"
        scrape_genre_page
        build_date
      else
        @link = "no link available"
      end
    end

    puts "\nmovies loaded".red
  end

  def self.build_date
    day = 0
    month = Date.today.strftime("%B")
    year = Date.today.strftime("%Y")
    if (@time.include?("8:") && @time.include?("PM"))
     day += 1
   else
     day
   end

   if day == 0 # this is d/t the sched. starting at 8pm on day 1
     day = 1
   end
   @date = Time.parse("#{month} #{day}").strftime("%B %d %A")
  end

  def self.scrape_genre_page
    begin
      doc = data_scraper(@genre)
      @genre_1 = doc.css("tr.tdrwodd").text.strip # gsub(/\n/, '').strip
      @genre_2 = doc.css("tr.tdreven").text.strip # gsub(/\n/, '').strip
      @year_released = doc.css("span.dbyear").text.gsub(/[()]/, '').strip
      if @year_released == "0"
        @year_released = "no release date provided"
      end
      rescue
      @genre = "no genre listed"
    end
      create_movie_obj
  end

  def self.create_movie_obj
    TcmMovieSearch::Movies.new(
      @date, @time, @title, @year_released,
      @description, @cast, @runtime,
      @link, @genre_1, @genre_2
      )
      @count += 1
  end
end
