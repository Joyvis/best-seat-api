# frozen_string_literal: true

class ReservationsController < ApplicationController
  def create
    result = Events::CreateReservation
             .call(event: event, reservations_params: reservations_params)

    if result.success?
      render json: result.reservations, status: :created
    else
      render json: { error: result.error }, status: :unprocessable_entity
    end
  end

  private

  def event
    Event.find(params[:event_id])
  end

  def reservations_params
    params
      .permit(reservations: %i[row column])
  end
end
