class AddDeckToDecks < ActiveRecord::Migration[5.1]
  def change
    add_reference :decks, :deck, foreign_key: true
  end
end
