module Api::V1
  class MoviesController < ApplicationController
    before_action :set_movie, only: [:show, :update, :destroy]
    before_filter :cors_set_access_control_headers

    def index
      @movies = Movie.all
      render json: object, status: status
    end

    def create
      @movie = Movie.create!(movie_params)
      json_response(@movie, :created)
    end

    def show
      json_response(@movie)
    end

    def update
      @movie.update(movie_params)
      head :no_content
    end

    def destroy
      @movie.destroy
      head :no_content
    end

    private

    def movie_params
      params.permit(
        :title, :director, :actors, :imdb_id, :year, :rating, :runtime, :genre,
        :plot, :poster_url, :rating, :created_by
      )
    end

    def set_movie
      @movie = Movie.find(params[:id])
    end

    def json_response(object, status = :ok)
      render json: object, status: status
    end

    def cors_set_access_control_headers
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
      headers['Access-Control-Request-Method'] = '*'
      headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'    
    end
  end
end
