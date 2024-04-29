class CreateCheckRecords < ActiveRecord::Migration[7.1]
    def change
      create_table :check_records do |t|
        t.references :check_list, null: false, foreign_key: true
  
        t.timestamps
      end
    end
end