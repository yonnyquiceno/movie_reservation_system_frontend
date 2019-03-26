class MoviesController < ApplicationController
  def index
    movies_service = MoviesService.new(date: resolve_date)
    @movies = movies_service.movies
    @next_available_movie_presentations_day = movies_service.next_available_movie_presentations_day
  end

  def create
    movies_service = MoviesService.new({movie: movie_params})
    response = movies_service.create_movie
    if response.code == 201
      redirect_to root_path, notice: JSON.parse(response.body)["message"]
    else
      redirect_to root_path, :flash => { :error => JSON.parse(response.body)["errors"] }
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :description, :image_url, :date_range, :date)
  end

  def resolve_date
    params['movie'].try(:[], 'date') || Date.today
  end
end
