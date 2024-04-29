class CreateCheckItems < ActiveRecord::Migration[7.1]
    def change
      create_table :check_items do |t|
        t.string :name, null: false
  
        t.timestamps
      end
    end
end