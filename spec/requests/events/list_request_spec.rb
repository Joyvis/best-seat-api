# frozen_string_literal: true

require 'rails_helper'

describe 'listing events', type: :request do
  before { get '/events' }
  let(:parsed_response) { JSON.parse(response.body, symbolize_names: true) }

  it 'events have been listed' do
    expect(response).to have_http_status(:ok)
    expect(parsed_response).to be_a(Array)
  end
end
