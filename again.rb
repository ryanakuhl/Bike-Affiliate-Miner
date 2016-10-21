require 'nokogiri'
require 'open-uri'

items = Array.new
prices = Array.new

doc = Nokogiri::HTML(open("http://www.thinkgeek.com/caffeine/feature/desc/0/all"))

items = doc.xpath("//div/a/h4").collect {|node| node.text.strip}

prices = doc.xpath("//div[contains(@class,'product')]/p[not(@style)]/text()").collect {|node| node.text.strip}
prices.delete("")


items.zip(prices).each do |title,price|
 puts title+" "+price
end