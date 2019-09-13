Scraper Data:

@site = "http://www.tcm.com/schedule/monthly.html?ecid=subnavmonthschedule"

doc = Nokogiri::HTML(open(@site))

movie_title = doc.css("h2 a")
description = doc.css("p.description")
link = doc.css('h2 a').map { |link| link['href'] }
genre = "#{link.first}genre.html"

movie_genre = Nokogiri::HTML(open(genre))
genre_even = movie_genre.css("tr.tdrwodd")
genre_odd = movie_genre.css("tr.tdreven")
title = movie_genre.css("span.db-movietitle")
year = movie_genre.css("span.dbyear")
# will remove the parentheses from the year to aid in search
# clean_year = year.gsub(/[()]/, "")

1. some sort of graphic on start-up - ASCII thingy
2. user menu for search choices:
    - start by asking for a month to search:
       I can use the same code-style as I did to add genre.html/ to scraping
       the movie's genre link -> just #{month} to the user's choice
   - title
   - year released
   - genre search
   - actor search
   - director search
      (use a case statement)
2a. Channge plans: User should be able to search any of the above choices
    without selecting the search object type - user can just enter search
    term and the application will search the entire collection and return
    the movie title, description, year released, actors, director.

3. end search method with return for another search until user enters "exit"

4.  Scraper and search functions in a separate class

Classes
 - Movie Search - where the work between the CLI and the scraper happens
 - CLI -          where the user interacts with the application
 - Scraper -      where the Scraping is happening!

Objectives:
  - 9/7/19  build methods in each class to pass parameters to the other classes
            and return some value to the method. (Practice working in classes).
            - complete.
  - 9/8/19  passing a value in the CLI to MovieSearch and then on to Scraper.
            a new and correct value is returned to the calling method
            - complete.
  - 9/8/19  finish watching tutorial/follow-along videos at Learn before trying
            to build objects and scraping data.
            - worked on search methods (4 of them).  Watched about 20 minutes
            of 1 video toady.
  -9/13/19  Working on scraping data from actual site and integrating into code.
