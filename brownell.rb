require 'nokogiri'
require 'open-uri'

items = Array.new
prices = Array.new

doc = Nokogiri::HTML(open("http://www.brownells.com/optics-mounting/scopes/rifle-scopes/bushnell-banner-riflescopes-prod56933.aspx"))

items = doc.xpath("//span[contains(@itemprop,'name')][not(@style)]/text()").collect {|node| node.text.strip}

prices = doc.xpath("//p[contains(@class,'prc')]/span[not(@style)]/text()").collect {|node| node.text.strip}
prices.delete("")


items.zip(prices).each do |title,price|
 puts title+" "+price
end