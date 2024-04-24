class TreasureBoxAward < ApplicationRecord
  belongs_to :award
  belongs_to :treasure_box
end
