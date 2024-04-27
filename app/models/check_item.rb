class CheckItem < ApplicationRecord
  has_many :check_lists_items, dependent: :destroy
  has_many :check_lists, through: :check_lists_items

  has_many :check_record_items, dependent: :destroy
  has_many :check_records, through: :check_record_items
end
