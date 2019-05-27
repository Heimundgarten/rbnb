class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.float :total_price
      t.date :date_borrowed
      t.date :date_returned
      t.references :user, foreign_key: true
      t.references :boardgame, foreign_key: true

      t.timestamps
    end
  end
end
