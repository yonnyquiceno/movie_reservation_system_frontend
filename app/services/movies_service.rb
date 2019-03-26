class MoviesService
  include HTTParty
  base_uri Rails.configuration.api_base_url

  def initialize(params={})
    @params = params
  end

  def movies
    get_movies["movies"]
  end

  def next_available_movie_presentations_day
    get_movies["next_available_movie_presentations_day"]
  end

  def create_movie
    self.class.post("/v1/movies", body: @params)
  end

  private

  def get_movies
    @response ||= self.class.get("/v1/movies", query: @params)
  end
end