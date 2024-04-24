class Award < ApplicationRecord
  has_many :treasure_box_awards, dependent: :destroy
  has_many :treasure_boxes, through: :treasure_box_award
  attr_writer :days_3_award_ids
  
  validates :prize, presence: true, uniqueness: true

  enum required_checks: { days_3: 0, weeks_3: 1, months_3: 2 }
end
