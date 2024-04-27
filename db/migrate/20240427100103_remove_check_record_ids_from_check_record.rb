class RemoveCheckRecordIdsFromCheckRecord < ActiveRecord::Migration[7.1]
  def up
    remove_column :check_records, :check_record_ids
  end

  def down
    add_column :check_records, :check_record_ids, :integer, null: false
  end
end
