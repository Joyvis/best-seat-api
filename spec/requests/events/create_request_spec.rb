# frozen_string_literal: true

require 'rails_helper'

describe 'creating an event', type: :request do
  before { post '/events', params: { event: params } }
  let(:parsed_response) { JSON.parse(response.body, symbolize_names: true) }

  context 'with all required parameters' do
    let(:params) { attributes_for(:event) }

    it 'event has been created' do
      expect(parsed_response).not_to be_a(Array)
      expect(response).to have_http_status(:created)
    end
  end

  context 'without all required parameters' do
    let(:params) { { foo: :bar } }

    it 'event has not been created' do
      expect(parsed_response).not_to be_a(Array)
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
