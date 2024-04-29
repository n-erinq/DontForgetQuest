class User < ApplicationRecord
  has_one :treasure_box
  has_one :check_list
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: { message: 'を入力してください' }
end
