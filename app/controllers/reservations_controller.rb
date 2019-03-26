class ReservationsController < ApplicationController
  def index
    reservations_service = ReservationsService.new(date_range: resolve_date_range)
    flash.now[:notice] = "No se ha seleccionado un rango de fechas, mostrando todas las reservaciones." unless resolve_date_range.present?
    @reservations = reservations_service.reservations
  end

  private

  def resolve_date_range
    @date_range ||= params['reservation'].try(:[], 'date_range')
  end
end
