class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.references :category, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
