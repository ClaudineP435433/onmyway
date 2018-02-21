require 'open-uri'
require 'nokogiri'

ville = 'bordeaux'
url = "https://www.yelp.fr/search?find_desc=Restaurants&find_loc=Bordeaux&start=60"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

html_doc.search('.m_titre_resultat a').each do |element|
  puts element.text.strip
  puts element.attribute('href').value
end
