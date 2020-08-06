class CreateReserves < ActiveRecord::Migration[6.0]
  def change
    create_table :reserves do |t|
      t.references :user, null: false
      t.references :event, null: false
      t.string :seat_code, null: false
      t.timestamps
    end
  end
end
