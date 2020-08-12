class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.references :event, null: false
      t.string :seat_code, null: false
      t.timestamps
    end
  end
end
