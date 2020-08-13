# frozen_string_literal: true

class EventsController < ApplicationController
  def index
    render json: Event.all
  end

  def create
    result = Events::Create.call(event_params: params)

    if result.success?
      render json: result.event.to_json, status: :created
    else
      render json: result.errors, status: :unprocessable_entity
    end
  end

  def best_seats
    result = Events::ListBestSeat.call(event: event,
                                       quantity: params[:quantity].to_i)
    if result.success?
      render json: result.seats.to_json
    else
      render json: result.errors
    end
  end

  private

  def event
    Event.find(params[:id])
  end
end
