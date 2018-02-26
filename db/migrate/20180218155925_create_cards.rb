class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.references :deck, foreign_key: true
      t.integer :order_number
      t.text :question
      t.text :answer

      t.timestamps
    end
  end
end
