class AddSeatUniquenessToReserve < ActiveRecord::Migration[6.0]
  def change
    add_index :reservations, [:seat_code, :event_id], unique: true
  end
end
