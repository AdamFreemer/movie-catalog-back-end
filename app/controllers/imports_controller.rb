class ImportsController < ApplicationController
  def new
  end

  def create
    file = params[:import][:file]
    movies = file.read
    movies_array = movies.split("\n")
    process_movie(movies_array)

    puts "-- movies imported: #{Movie.count}"
    redirect_to '/imports/new'
  end

  def process_movie(movies_array)
    movies_array.each do |m|
      movie = Movie.new
      movie.year = m[/\(.*?\)/]&.tr('()', '')
      movie.resolution = m[/\[.*?\]/]&.tr('[]', '')
      movie.title = m.split('(')&.first&.strip
      movie.file_format = m&.split('.')&.last&.strip
      movie.save
      omdb_lookup(movie)
    end
  end

  def omdb_lookup(movie)
    apikey = ENV['OMDB_KEY']
    base_url = 'http://www.omdbapi.com/?t='
    title = URI.encode_www_form_component(movie.title)
    uri = URI("#{base_url}#{title}&y=#{movie.year}&apikey=#{apikey}")
    response = Net::HTTP.get_response(uri)
    omdb_movie_data = JSON.parse(response.body)
    movie.director = omdb_movie_data['Director']
    movie.actors = omdb_movie_data['Actors']
    movie.imdb_id = omdb_movie_data['imdbID']
    movie.rated = omdb_movie_data['Rated']
    movie.runtime = omdb_movie_data['Runtime']
    movie.genre = omdb_movie_data['Genre']
    movie.plot = omdb_movie_data['Plot']
    movie.image_url = omdb_movie_data['Poster']
    movie.save
  end
end
