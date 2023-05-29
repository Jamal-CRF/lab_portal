class Hospital < ApplicationRecord
  has_many :user_hospitals
  has_many :users, through: :user_hospitals, class_name: 'User'
  has_many :exames

  validates :name, presence: true
end
