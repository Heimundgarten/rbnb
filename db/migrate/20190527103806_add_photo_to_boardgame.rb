class AddPhotoToBoardgame < ActiveRecord::Migration[5.2]
  def change
    add_column :boardgames, :photo, :string
  end
end
