# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  def render_not_found
    render :nothing, status: :not_found
  end
end
