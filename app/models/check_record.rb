class CheckRecord < ApplicationRecord
  belongs_to :check_list
  has_many :check_record_items, dependent: :destroy
  has_many :check_items, through: :check_record_items
end
