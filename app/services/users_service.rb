class UsersService
  include HTTParty
  base_uri Rails.configuration.api_base_url

  def initialize(params={})
    @params = params
  end

  def create_user
    self.class.post("/v1/users", body: @params)
  end
end