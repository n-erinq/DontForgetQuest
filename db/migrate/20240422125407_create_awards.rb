class CreateAwards < ActiveRecord::Migration[7.1]
  def change
    create_table :awards do |t|
      t.string :prize, null: false
      t.integer :required_checks, default: 0, null: false

      t.timestamps
    end
  end
end
