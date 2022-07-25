require 'nokogiri'
require 'open-uri'


class Scraper
    BASE_URL = "https://www.allrecipes.com/search/results/?search="

  def initialize(keyword)
    @keyword = keyword
  end
  
  def call
    # Create url interpoated with the keyword
    url = "#{BASE_URL}#{@keyword}"
    # Download the page => URI.open(url).read
    html = URI.open(url).read
    # Make nokogiri object
    doc = Nokogiri::HTML(html)
    # Scrape for name/description
    recipes = doc.search(".card__detailsContainer").first(5).map do |element|
      name = element.search(".card__title").text.strip
      description = element.search(".card__summary").text.strip
      rating = element.search(".review-star-text").text.strip.match(/\d\.?\d*/)[0]
      url = element.search(".card__titleLink").attribute("href").value
      recipe_html = URI.open(url).read
      recipe_doc = Nokogiri::HTML(recipe_html)
      prep_time = recipe_doc.search(".recipe-meta-item:contains('total')").text.strip.match(/\d\s?\w+\s?\d*\s?\w+/)[0]
      Recipe.new(name: name, description: description, rating: rating, prep_time: prep_time)
    end
    recipes
  end
  
end

# Scraper.new("chocolate").call