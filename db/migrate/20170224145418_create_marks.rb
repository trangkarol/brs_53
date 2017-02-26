class CreateMarks < ActiveRecord::Migration[5.0]
  def change
    create_table :marks do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
