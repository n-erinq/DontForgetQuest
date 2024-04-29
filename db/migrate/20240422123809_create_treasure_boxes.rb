class CreateTreasureBoxes < ActiveRecord::Migration[7.1]
    def change
      create_table :treasure_boxes do |t|
        t.references :user, foreign_key: true
        t.boolean :opened, default: false
  
        t.timestamps
      end
    end
end