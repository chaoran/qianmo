require 'open-uri'
require 'json'
require 'nokogiri'

class DoubanController < ApplicationController
  CAT_CODE = {"book" => "1001", "movie" => "1002", "music" => "1003"}
  
  before_filter do
    params[:category] = "music" if params[:category] == "album"
  end

  def search
    url = search_url(params[:category], params[:name])
    begin
      html = Nokogiri::HTML(open(url, "Cookie" => 'bid="FqX3Aa+Pcl4"', :read_timeout => 10).read) # bid is require to search music on douban
    rescue
      flash.now[:error] = I18n.t("errors.messages.please_try_later")
      render "error"
      return
    end
    doc = html.css(".article table .item")
    @items = []
    doc.each do |t|
      item = Hash.new
      item[:id] = t.children[0].css("a")[0].attr("href").split("/").last
      item[:image] = t.children[0].css("a img")[0].attr("src")
      item[:title] = t.children[1].css(".pl2 a")[0].content
      item[:summary] = t.children[1].css(".pl")[0].content
      @items.append(item) if item[:title].valid_encoding? && item[:summary].valid_encoding?
    end
  end

  def get
    url = get_url(params[:category], params[:id])
    @item = JSON.parse(open(url).read)
    render "get_#{params[:category]}"
  end
  
  protected
  
  def search_url(category, name)
    "http://#{category}.douban.com/subject_search" +
    "?search_text=#{URI.encode(name)}&cat=#{CAT_CODE[category]}"
  end
  
  def get_url(category, id)
    "http://api.douban.com/v2/#{category}/#{id}"
  end
end
