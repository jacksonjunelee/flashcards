class CreateFlashcards < ActiveRecord::Migration[5.0]
  def change
    create_table :flashcards do |t|
      t.text :question
      t.text :answer

      t.timestamps
    end
  end
end
