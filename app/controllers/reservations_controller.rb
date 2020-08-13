# frozen_string_literal: true

class ReservationsController < ApplicationController
  def create
    result = Reservations::Create
             .call(event: event, reservations_params: params)

    if result.success?
      render json: result.reservations.to_json, status: :created
    else
      render json: result.errors, status: :unprocessable_entity
    end
  end

  private

  def event
    Event.find(params[:event_id])
  end
end
