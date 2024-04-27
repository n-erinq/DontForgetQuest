class AddCheckRecordIdsToCheckRecords < ActiveRecord::Migration[7.1]
  def change
    add_column :check_records, :check_record_ids, :integer, null: false
  end
end
