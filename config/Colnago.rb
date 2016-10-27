require 'nokogiri'
require 'open-uri'

#JensonUSA, Wiggle, Competitive Cyclist, BikeExchange

items = Array.new
prices = Array.new

doc = Nokogiri::HTML(open("http://www.jensonusa.com/Colnago/Road-Bikes/Road?s=h&pg=100&noidx=1&by=Brands"))

items = doc.xpath("//div/a[contains(@class,'prlist-name')][not(@style)]/text()").collect {|node| node.text.strip}
prices.delete("")

prices = doc.xpath("//div/div[contains(@class,'product-price-adj')][not(@style)]/text()").collect {|node| node.text.strip}
prices.delete("")
items.zip(prices).each do |title,price|
 puts "JensonUSA"+" "+title+" "+price

end

w_items = Array.new
w_prices = Array.new

doc = Nokogiri::HTML(open("http://www.wiggle.com/cycle/road-bikes/?ea=4294789497"))

w_items = doc.xpath("//a[contains(@data-ga-action,'Product Title')][not(@style)]/text()").collect {|node| node.text.strip}

w_prices = doc.xpath("//div[contains(@class,'price')]/span[contains(@class,'price')][not(@style)]/text()").collect {|node| node.text.strip}
w_prices.delete("")

w_items.zip(w_prices).each do |title2,price2|
 puts "Wiggle"+" "+title2+" "+price2

end

c_items = Array.new
c_prices = Array.new

doc = Nokogiri::HTML(open("http://www.competitivecyclist.com/road-bikes?sort=-price&p=brand%3AColnago&nf=1"))

c_items = doc.xpath("//span[contains(@class,'ui-pl-name-title')][not(@style)]/text()").collect {|node| node.text.strip}

c_prices = doc.xpath("//span[contains(@class,'pl-pricing')]/span[contains(@class,'price-sale') or contains(@class,'price-retail')][not(@style)]/text()").collect {|node| node.text.strip}
c_prices.delete("")

c_items.zip(c_prices).each do |title3,price3|
 puts "Competitive Cyclist"+" "+title3+" "+price3

end

a_items = Array.new
a_prices = Array.new

doc = Nokogiri::HTML(open("http://www.bicycleemporium.com/categories/bikes/colnago-bikes.aspx"))

a_items = doc.xpath("//span[contains(@id,'ProductName')][not(@style)]/text()").collect {|node| node.text.strip}

a_prices = doc.xpath("//span[contains(@id,'SalesPrice')][not(@style)]/text()").collect {|node| node.text.strip}
a_prices.delete("")

a_items.zip(a_prices).each do |title4,price4|
 puts "Bicycle Emporium"+" "+title4+" "+price4

end

p_items = Array.new
p_prices = Array.new

doc = Nokogiri::HTML(open("http://www.bikeprosusa.com/colnago-online/"))

p_items = doc.xpath("//div[not(contains(@class,'sold-out'))]/div/div/div[contains(@class,'product-title')][not(@style)]/text()").collect {|node| node.text.strip}

p_prices = doc.xpath("//div[contains(@class,'product-pric')]/span[1][not(@style)]/text()").collect {|node| node.text.strip}
p_prices.delete("")

p_items.zip(p_prices).each do |title5,price5|
 puts "Bike Pro"+" "+title5+" "+price5

end


