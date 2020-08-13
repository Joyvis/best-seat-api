# frozen_string_literal: true

module Reservations
  class Create
    include Interactor::Organizer

    organize CreateStep::NormalizeParameters,
             CreateStep::SaveReservation,
             CreateStep::SerializeReservation
  end
end
