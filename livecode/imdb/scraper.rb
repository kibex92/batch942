require 'open-uri'
require 'nokogiri'

def fetch_movie_urls
  # 1. Define TOP 250 URL variable
  url = "https://www.imdb.com/chart/top"

  # 2. open url and save content
  html = URI.open(url).read
  # 3. Create nokogori object
  doc = Nokogiri::HTML(html)
  base_url = "https://www.imdb.com"
  movies = doc.search(".titleColumn a").first(5).map do |element|
    base_url + element["href"]
  end
  movies
  # 4. search within the nokogiri object
end

def fetch_movie_data(url)
  html = URI.open(url, "Accept-Language" => "en-US").read
  doc = Nokogiri::HTML(html)

  storyline = doc.search(".sc-16ede01-2").text.strip
  title = doc.search("h1").text.strip
  year = doc.search(".sc-8c396aa2-2").first.text.strip.to_i
  director = doc.search(".ipc-metadata-list__item:contains('Director') .ipc-metadata-list-item__list-content-item").first.text.strip
  cast = doc.search(".ipc-metadata-list__item:contains('Stars') .ipc-metadata-list-item__list-content-item").map { |element| p element.text.strip}.uniq
    {
        storyline: storyline,
      title: title,
      year: year,
      director: director,
      cast: cast
      }
end

# {
#    cast: [ "Christian Bale", "Heath Ledger", "Aaron Eckhart" ],
#  }

fetch_movie_data("https://www.imdb.com/title/tt0068646/")