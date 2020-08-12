# frozen_string_literal: true

require 'rails_helper'

describe Events::ListBestSeatStep::CreateEventArrayModel, type: :interactor do
  describe '.call' do
    subject { described_class.call(event: event, quantity: quantity) }

    context 'with valid parameters' do
      let(:event) { create(:event) }
      let(:quantity) { 2 }

      context 'and no reservations created' do
        it 'array has been created' do
          expect(subject.event_array_model).to be_a(Array)
          expect(subject.success?).to be_truthy
          expect(subject.event_array_model.count).to eq(event.rows)
          expect(subject.event_array_model.first.count).to eq(event.columns)
          expect(subject.event_array_model.flatten.tally[:free])
            .to eq(event.rows * event.columns)
        end
      end

      context 'and all seats are unavailable' do
        before do
          (1..event.rows).to_a.each do |row|
            (1..event.columns).to_a.each do |column|
              create(:reservation, row: row, column: column, event: event)
            end
          end
        end

        it 'array has not been created' do
          expect(subject.success?).to be_falsey
        end
      end
    end

    context 'with invalid parameters' do
      let(:event) { nil }
      let(:quantity) { 0 }

      it 'array has not been created' do
        expect { subject.event_array_model }.to raise_error(NoMethodError)
      end
    end
  end
end
