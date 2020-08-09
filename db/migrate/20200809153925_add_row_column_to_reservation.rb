class AddRowColumnToReservation < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :row, :integer, nul: false
    add_column :reservations, :column, :integer, nul: false
  end
end
