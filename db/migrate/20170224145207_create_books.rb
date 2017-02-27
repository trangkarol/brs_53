class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :introduction
      t.references :category, foreign_key: true
      t.string :author
      t.datetime :publish_date
      t.integer :page_number
      t.string :picture

      t.timestamps
    end
  end
end
