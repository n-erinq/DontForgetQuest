class Award < ApplicationRecord
  has_many :treasure_box_awards, dependent: :destroy
  has_many :treasure_boxes, through: :treasure_box_award
  
  validates :prize, presence: true, uniqueness: true

  enum required_checks: { days_3: 0, weeks_3: 1, months_3: 2 }

  scope :with_required_check_weeks_3, -> { where(required_checks: required_checks[:weeks_3]) }
  scope :with_required_check_months_3, -> { where(required_checks: required_checks[:months_3]) }
end
