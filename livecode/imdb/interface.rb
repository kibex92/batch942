require_relative './scraper'
require 'yaml'
urls = fetch_movie_urls
movies = urls.map do |url|
  fetch_movie_data(url)
end

movie_yaml = movies.to_yaml

File.open("movies.yml", "wb") do |file|
  file.write(movie_yaml)
end