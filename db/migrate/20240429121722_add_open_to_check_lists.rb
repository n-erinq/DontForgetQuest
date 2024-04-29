class AddOpenToCheckLists < ActiveRecord::Migration[7.1]
  def change
    add_column :check_lists, :open, :boolean, default: true
  end
end
