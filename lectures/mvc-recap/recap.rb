require 'open-uri'
require 'nokogiri'

url = "https://www.allrecipes.com/search?q=chocolate" # The URL you want to download
html = URI.open(url).read # Downloading the url and storing in variable
doc = Nokogiri::HTML.parse(html) # Transforming the string we get back into a usable object with Nokogiri

doc.search(".mntl-card-list-items").each do |element| # Iterating for the selector to search for every card on the site
  unless element.search(".recipe-card-meta__rating-count").empty? # Check if there is a rating class, only then attempt the scraping


  end
end