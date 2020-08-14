# frozen_string_literal: true

require 'rails_helper'

describe Reservations::CreateStep::SerializeReservation, type: :interactor do
  subject { described_class.call(reservations: reservations) }

  let(:reservations) { create_list(:reservation, 2) }

  it 'event has been serialized' do
    expect(subject.reservations.first).to be_a(ReservationSerializer)
    expect(subject.reservations)
      .to be_a(ActiveModel::Serializer::CollectionSerializer)
  end
end
