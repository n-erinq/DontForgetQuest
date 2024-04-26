class CreateCheckListsItems < ActiveRecord::Migration[7.1]
  def change
    create_table :check_lists_items do |t|
      t.references :check_list, null: false, foreign_key: true
      t.references :check_item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
