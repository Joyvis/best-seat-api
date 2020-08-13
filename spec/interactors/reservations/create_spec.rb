# frozen_string_literal: true

require 'rails_helper'

describe Reservations::Create, type: :interactor do
  describe '.call' do
    let(:event) { create(:event) }
    subject do
      described_class.call(event: event,
                           reservations_params: reservations_params)
    end
    context 'with valid parameters' do
      let(:reservations_params) do
        {
          reservations:
          [attributes_for(:reservation, row: 1, column: 1),
           attributes_for(:reservation, row: 1, column: 2),
           attributes_for(:reservation, row: 1, column: 3)]
        }
      end

      it 'reservations have been created' do
        expect(subject.success?).to be_truthy
      end
    end

    context 'with invalid parameters' do
      let(:reservations_params) do
        {
          reservations:
          [attributes_for(:reservation, row: 1, column: 1),
           attributes_for(:reservation, row: 1, column: 2),
           attributes_for(:reservation, row: 1, column: 2)]
        }
      end

      it 'reservations have not been created' do
        expect(subject.success?).to be_falsey
      end
    end
  end
end
