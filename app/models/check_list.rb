class CheckList < ApplicationRecord
  belongs_to :user
  has_many :check_lists_items, dependent: :destroy
  has_many :check_items, through: :check_lists_items
  has_many :check_records

  enum period: { days_3: 0, weeks_3: 1, months_3: 2 }

  validates :open, uniqueness: { scope: :user_id, message: "はすでに存在します" }, if: :open?

  def open?
    open
  end
end
