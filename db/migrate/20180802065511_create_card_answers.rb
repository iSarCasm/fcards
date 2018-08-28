class CreateCardAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :card_answers do |t|
      t.references :card

      t.timestamps
    end
  end
end
