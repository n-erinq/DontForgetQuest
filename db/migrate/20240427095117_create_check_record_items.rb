class CreateCheckRecordItems < ActiveRecord::Migration[7.1]
    def change
      create_table :check_record_items do |t|
        t.references :check_record, null: false, foreign_key: true
        t.references :check_item, null: false, foreign_key: true
  
        t.timestamps
      end
    end
end