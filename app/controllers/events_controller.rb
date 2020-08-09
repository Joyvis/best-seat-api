# frozen_string_literal: true

class EventsController < ApplicationController
  def index
    render json: Event.all
  end

  def create
    event = Event.new(event_params)

    if event.save
      render json: event.attributes, status: :created
    else
      render json: event.errors, status: :unprocessable_entity
    end
  end

  def best_seat

  end

  private

  def event_params
    params.require(:event).permit(:name, :rows, :columns)
  end
end
