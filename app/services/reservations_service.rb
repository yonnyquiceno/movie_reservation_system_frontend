class ReservationsService
  include HTTParty
  base_uri Rails.configuration.api_base_url

  def initialize(params={})
    @params = params
  end

  def reservations
    self.class.get("/v1/reservations", query: @params)
  end
end