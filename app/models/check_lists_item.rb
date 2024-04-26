class CheckListsItem < ApplicationRecord
  belongs_to :check_item
  belongs_to :check_list
end
