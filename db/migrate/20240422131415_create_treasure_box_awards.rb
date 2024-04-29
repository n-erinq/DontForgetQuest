class CreateTreasureBoxAwards < ActiveRecord::Migration[7.1]
    def change
      create_table :treasure_box_awards do |t|
        t.references :treasure_box, null: false, foreign_key: true
        t.references :award, null: false, foreign_key: true
  
        t.timestamps
      end
    end
end