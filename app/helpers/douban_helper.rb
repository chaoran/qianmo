# encoding: utf-8

module DoubanHelper
  def get_year_from_date(date)
    
    year = date.split("-")[0]
  end
  
  def get_month_from_date(date)
    month = date.split("-")[1]
    month[1..-1] if month.start_with?("0")
  end
  
  def get_day_from_date(date)
    day = date.split("-")[2].split("(")[0]
    day[1..-1] if day.start_with?("0")
  end
  
  def parse_date(date)
    date.gsub!(/\(.*\)|日/, "")
    date.gsub!(/[年月]/, "-")
    if date.include?("-")
      date.split("-")
    elsif date.include?("/")
      date.split("/")
    else
      [date, 0, 0]
    end
  end
end
