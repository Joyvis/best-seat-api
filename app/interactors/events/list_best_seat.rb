# frozen_string_literal: true

module Events
  class ListBestSeat
    include Interactor::Organizer

    organize ListBestSeatStep::CreateEventArrayModel,
             ListBestSeatStep::FindPerfectSeat,
             ListBestSeatStep::FindBestSeatByScore
  end
end
