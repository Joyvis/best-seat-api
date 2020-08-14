# frozen_string_literal: true

require 'rails_helper'

describe 'showing a event', type: :request do
  before { get "/events/#{event_id}" }

  context 'with a valid id' do
    let(:event_id) { create(:event).id }

    it 'event has been shown' do
      expect(response).to have_http_status(:ok)
    end
  end

  context 'with a invalid id' do
    let(:event_id) { 'aaaa' }

    it 'event has been shown' do
      expect(response).to have_http_status(:not_found)
    end
  end
end
