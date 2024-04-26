class CheckItem < ApplicationRecord
  has_many :check_lists_items, dependent: :destroy
  has_many :check_lists, through: :check_lists_items

end
