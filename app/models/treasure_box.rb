class TreasureBox < ApplicationRecord
  belongs_to :user
  has_many :treasure_box_awards, dependent: :destroy
  has_many :awards, through: :treasure_box_awards

end
