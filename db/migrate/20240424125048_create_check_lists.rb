class CreateCheckLists < ActiveRecord::Migration[7.1]
  def change
    create_table :check_lists do |t|
      t.references :user, foreign_key: true
      t.string :name, null: false
      t.integer :period, null: false

      t.timestamps
    end
  end
end
