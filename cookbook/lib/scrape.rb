require 'nokogiri'
require 'open-uri'


file = '../data/fraise.html'
file1 = '../data/strawberry.html'
html_doc = Nokogiri::HTML(File.open(file), nil, 'utf-8')

url = "file://Users/suthan/code/suthancoder/exercises/exercises-feb19/cookbook/data/strawberry.html"

url1 = "https://www.bbc.co.uk/search?q=bitcoin"

url2 = "file:///Users/suthan/code/suthancoder/exercises/exercises-feb19/cookbook/data/fraise.html"

url3 = "http://www.letscookfrench.com/recipes/find-recipe.aspx?aqt=strawberry"

string_doc = Nokogiri::HTML(open(file1), nil, 'utf-8')

puts string_doc
