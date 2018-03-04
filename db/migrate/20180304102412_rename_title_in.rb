class RenameTitleIn < ActiveRecord::Migration[5.1]
  def change
    rename_column :decks, :title, :deck_title
  end
end
