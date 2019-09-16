#!/usr/bin/env ruby

# This is my environment file!
require 'nokogiri'
require 'open-uri'

require_relative "./tcm_movie_search/version"
require_relative "./tcm_movie_search/cli"
require_relative './tcm_movie_search/movie_search'
require_relative './tcm_movie_search/scraper'
require_relative './tcm_movie_search/movies'
require_relative './tcm_movie_scraper/movie_title_scraper'

require 'pry'
require 'colorize'

module TcmMovieSearch
  class Error < StandardError; end
  # Your code goes here...
end
