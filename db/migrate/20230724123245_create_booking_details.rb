class CreateBookingDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :booking_details do |t|
      t.date :date
      t.string :huber
      t.string :time_slote
      t.string :seating
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
