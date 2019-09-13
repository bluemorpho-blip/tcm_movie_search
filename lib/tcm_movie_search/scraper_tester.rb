require 'nokogiri'
require 'open-uri'
site = "http://www.tcm.com/schedule/monthly.html?ecid=subnavmonthschedule"

page = Nokogiri::HTML(open(site))

movies = page.css("h2 a")
description = page.css("p.description")
link = page.css('h2 a').map { |link| link['href'] }
genre = "#{link.first}genre.html"

movie_genre = Nokogiri::HTML(open(genre))
genre_even = movie_genre.css("tr.tdrwodd")
genre_odd = movie_genre.css("tr.tdreven")
title = movie_genre.css("span.db-movietitle")
year = movie_genre.css("span.dbyear")
# will remove the parentheses from the year to aid in search
# clean_year = year.gsub(/[()]/, "")

  puts "movies count = #{movies.count}"
  puts ""
  puts "Title:"
  puts title.text
  # puts clean_year.text
  puts year.text
  puts ""
  puts "Description: #{description.first.text}"
  puts ""
  puts "Movie Link: #{link.first}"
  puts "Genre Link: #{link.first}genre.html"
  puts genre_even.text
  puts genre_odd.text
  puts ""

  # set a class for searching methods:
  # title
  # year
  # genre
  # actor
  # ? director
  # searches will also return the number of found movies
  noir_count = 0
  if (genre_even == "Crime" || genre_odd == "Crime")
    noir_count +=1
    puts "film noir"

  elsif (genre_even == "Romance" || genre_odd == "Romance")
    puts "puh-leez!"
   else
    puts "not (genre) noir"
    puts "this month's (searched genre) noir movies = #{noir_count}"
  # change above if-else to .include? instead of == in actual code since there
  # are several genre categories per title.  Used == here to keep flow going
  # in Nokogiri checks
  end
# genre = "http://www.tcm.com/tcmdb/title/14840/The-Merry-Widow/genre.html"

#if the result is an empty array [], the content you want is probably being loaded with javascript

#.text works on an array
#['href'] does NOT work on an array

#if it's a really long result and you can't tell if the content you want is in there, try chaining .text to the end.
  #for example:
    #page.css("div.main-content").text  OR  #page.css("div.main-content")[0].text

puts ""
 "Finished running code"
