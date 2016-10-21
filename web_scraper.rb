require 'rubygems'
require 'HTTParty'
require 'Nokogiri'
require 'JSON'
require 'Pry'
require 'csv'

page = HTTParty.get('https://newyork.craigslist.org/search/pet?s=0')

Pry.start(binding)