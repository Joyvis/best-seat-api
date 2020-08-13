# frozen_string_literal: true

require 'rails_helper'

describe 'creating reservations', type: :request do
  let(:event_id) { create(:event).id }
  let(:parsed_response) { JSON.parse(response.body, symbolize_names: true) }
  before do
    post "/events/#{event_id}/reservations", params: { reservations: params }
  end

  context 'with valid parameters' do
    let(:params) do
      [attributes_for(:reservation, row: 1, column: 1),
       attributes_for(:reservation, row: 1, column: 2),
       attributes_for(:reservation, row: 1, column: 3)]
    end

    it 'reservations have been created' do
      expect(response).to have_http_status(:created)
    end
  end

  context 'with invalid parameters' do
    let(:params) do
      [attributes_for(:reservation, row: 1, column: 2),
       attributes_for(:reservation, row: 1, column: 1),
       attributes_for(:reservation, row: 1, column: 1)]
    end

    it 'reservations have not been created' do
      expect(response).to have_http_status(:unprocessable_entity)
      expect(parsed_response[:errors]).to be_present
    end
  end
end
