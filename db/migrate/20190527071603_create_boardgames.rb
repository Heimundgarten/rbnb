class CreateBoardgames < ActiveRecord::Migration[5.2]
  def change
    create_table :boardgames do |t|
      t.string :name
      t.text :description
      t.integer :year
      t.float :price_per_day

      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
