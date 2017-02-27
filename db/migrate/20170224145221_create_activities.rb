class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.references :user, foreign_key: true
      t.string :target_type
      t.integer :target_id
      t.string :action_type

      t.timestamps
    end
  end
end
