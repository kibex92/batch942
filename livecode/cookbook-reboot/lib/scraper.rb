require 'nokogiri'
require 'open-uri'
require 'pry'


class Scraper
    BASE_URL = "https://www.allrecipes.com/search?q="

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
    recipes = []
    doc.search(".mntl-card-list-items").map do |element|
      unless element.search(".mntl-recipe-star-rating").empty?
        details_url = element.attribute("href").value
        
        recipe_html = URI.open(details_url).read
        recipe_doc = Nokogiri::HTML(recipe_html)
        
        name = recipe_doc.search("h1").text.strip
        rating = recipe_doc.search(".mntl-recipe-review-bar__rating").text.strip
        description = recipe_doc.search("h2").first.text.strip
        if recipe_doc.search(".mntl-recipe-details__label:contains('Total Time') ~ .mntl-recipe-details__value").empty?
          prep_time = "No prep time provided"
        else
          prep_time = recipe_doc.search(".mntl-recipe-details__label:contains('Total Time') ~ .mntl-recipe-details__value").text.strip
        end
        recipe = Recipe.new(name: name, description: description, rating: rating, prep_time: prep_time)
        recipes << recipe
      end
    end
    recipes.first(5)
  end
  
end

# Scraper.new("chocolate").call