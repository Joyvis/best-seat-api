# frozen_string_literal: true

require 'rails_helper'

describe Reservations::CreateStep::SaveReservation, type: :interactor do
  subject do
    described_class.call(reservations_params: reservations, event: event)
  end

  context 'with valid parameters' do
    let(:event) { create(:event) }

    context 'and it is receiving a hash parameter' do
      let(:reservations) { [attributes_for(:reservation)] }

      it 'reservations have been created' do
        expect(subject.reservations.first).to be_a(Reservation)
        expect(subject.success?).to be_truthy
        expect(subject.reservations.first.valid?).to be_truthy
        expect(subject.errors).not_to be_present
        expect(subject.reservations)
          .to be_a(ActiveRecord::Associations::CollectionProxy)
      end
    end
  end

  context 'with invalid parameters' do
    let(:reservations) { [{ row: 1 }] }

    context 'and event does not exist' do
      let(:event) { nil }

      it 'reservations have not been created' do
        expect { subject }.to raise_error(NoMethodError)
      end
    end

    context 'and event exists' do
      let(:event) { create(:event) }

      it 'reservations have not been created' do
        expect(subject.failure?).to be_truthy
        expect(subject.errors).to be_present
      end
    end
  end
end
