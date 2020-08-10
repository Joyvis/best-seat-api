# frozen_string_literal: true

require 'rails_helper'

describe Events::ListBestSeatStep::FindPerfectSeat, type: :interactor do
  describe '.call' do
    subject { described_class.call(event_array_model: event_array_model) }

    context 'with valid parameters' do
      let(:event_array_model) { Array.new(4) { Array.new(3) } }

      it 'perfect seat has been found' do
        expect(subject.perfect_seat).to be_a(Hash)
        expect(subject.perfect_seat.keys).to include(:row, :column)
      end
    end

    context 'with invalid parameters' do
      context 'and it is a empty array' do
        let(:event_array_model) { [] }

        it 'perfect seat has not been found' do
          expect { subject }.to raise_error(NoMethodError)
        end
      end

      context 'and it is a nil value' do
        let(:event_array_model) { nil }

        it 'perfect seat has not been found' do
          expect { subject }.to raise_error(NoMethodError)
        end
      end
    end
  end
end
