class UsersController < ApplicationController
  def create
    users_service = UsersService.new({user: user_params})
    response = users_service.create_user
    if response.code == 201
      redirect_to reservations_path, notice: JSON.parse(response.body)["message"]
    else
      redirect_to root_path, :flash => { :error => JSON.parse(response.body)["errors"] }
    end
  end

  private

  def user_params
    params.require(:user).permit(:cellphone, :personal_id, :email, :names, reservation_attributes: [ :movie_id, :date ])
  end
end
