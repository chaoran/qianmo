require 'open-uri'
require 'json'
require 'nokogiri'

class DoubanController < ApplicationController
  CAT_CODE = {"book" => "1001", "movie" => "1002", "music" => "1003"}
  SEARCH_ADDR = "http://movie.douban.com/subject_search"
  GET_ADDR = "http://api.douban.com/v2/movie/"
  def search
    url = SEARCH_ADDR + "?search_text=#{URI.encode(params[:name])}&cat=#{CAT_CODE[params[:category]]}"
    doc = Nokogiri::HTML(open(url)).css(".article table .item")
    @movies = []
    doc.each do |t|
      movie = Movie.new
      movie.douban_id = t.children[0].css("a")[0].attr("href").split("/").last
      movie.douban_image = t.children[0].css("a img")[0].attr("src")
      movie.title = t.children[1].css(".pl2 a")[0].content
      movie.douban_summary = t.children[1].css(".pl")[0].content
      @movies.append(movie)
    end
  end

  def get
    url = GET_ADDR + "#{params[:id]}"
    @movie = JSON.parse(open(url).read)
  end
end
