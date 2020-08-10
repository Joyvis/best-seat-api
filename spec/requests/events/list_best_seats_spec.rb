# frozen_string_literal: true

require 'rails_helper'

describe 'listing best seats', type: :request do
  let(:event) { create(:event) }
  let(:reservations) { nil }
  let(:parsed_response) { JSON.parse(response.body, symbolize_names: true) }

  before do
    reservations
    get "/events/#{event_id}/best_seats?quantity=#{quantity}"
  end

  context 'when event exists' do
    let(:event_id) { event.id }

    context 'and a valid quatity is sent' do
      let(:quantity) { 2 }

      context 'and reservations was priviously created' do
        let(:reservations) { create(:reservation, event: event) }

        it 'best seats have been listed' do
          expect(response).to have_http_status(:ok)
          expect(parsed_response).to be_a(Array)
          expect(parsed_response).not_to be_empty
        end
      end

      context 'and reservations was not priviously created' do
        let(:reservations) { nil }

        it 'best seats have been listed' do
          expect(response).to have_http_status(:ok)
          expect(parsed_response).to be_a(Array)
          expect(parsed_response).not_to be_empty
        end
      end

      context 'and all seats are unavailable' do
        let(:reservations) do
          (1..event.rows).to_a.each do |row|
            (1..event.columns).to_a.each do |column|
              create(:reservation, row: row, column: column, event: event)
            end
          end
        end

        it 'best seats have not been listed' do
          expect(response).to have_http_status(:ok)
          expect(parsed_response).to be_a(Array)
          expect(parsed_response).to be_empty
        end
      end
    end
  end
end
