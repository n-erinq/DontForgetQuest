class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_one :treasure_box
  has_one :open_check_list, -> { where(open: true) }, class_name: 'CheckList'
  has_many :check_lists 

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: { message: 'を入力してください' }
end
