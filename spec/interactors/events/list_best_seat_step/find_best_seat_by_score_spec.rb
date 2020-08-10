# frozen_string_literal: true

require 'rails_helper'

describe Events::ListBestSeatStep::FindBestSeatByScore, type: :interactor do
  describe '.call' do
    subject do
      described_class.call(event: event, quantity: quantity,
                           event_array_model: event_array_model,
                           perfect_seat: perfect_seat)
    end

    context 'with valid parameters' do
      let(:event) { create(:event) }
      let(:perfect_seat) { { row: 0, column: 3 } }
      let(:event_array_model) do
        Array.new(event.rows) { Array.new(event.columns, :free) }
      end

      context 'and requesting a group of seats' do
        let(:quantity) { 2 }

        it 'best seat has been found' do
          expect(subject.best_seats).to be_a(Array)
          expect(subject.best_seats.count).to eq(quantity)
          expect(subject.success?).to be_truthy
        end
      end

      context 'and requesting a single seat' do
        let(:quantity) { 1 }

        it 'best seat has been found' do
          expect(subject.best_seats).to be_a(Array)
          expect(subject.best_seats.count).to eq(quantity)
          expect(subject.success?).to be_truthy
        end
      end

      context 'and all seats are unavailable' do
        let(:quantity) { 2 }
        let(:event_array_model) do
          array = Array.new(event.rows) { Array.new(event.columns, :reserved) }
          array[0][0] = :free
          array[3][1] = :free
          array
        end

        it 'best seat has been found' do
          expect(subject.success?).to be_falsey
        end
      end
    end

    context 'with invalid parameters' do
      let(:event) { nil }
      let(:perfect_seat) { nil }
      let(:event_array_model) { nil }
      let(:quantity) { nil }

      it 'best seat has not been found' do
        expect { subject }.to raise_error(NoMethodError)
      end
    end
  end
end
