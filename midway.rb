require 'nokogiri'
require 'open-uri'

items = Array.new
prices = Array.new

doc = Nokogiri::HTML(open("http://www.midwayusa.com/s?userSearchQuery=Bushnell+Banner"))

items = doc.xpath("//a[contains(@class,'product-description')][not(@style)]/text()").collect {|node| node.text.strip}

prices = doc.xpath("//div[contains(@class,'priceblock ')]/div/span[1]").collect {|node| node.text.strip}
prices.delete("")


items.zip(prices).each do |title,price|
 puts title+" "+price
end
