class Exame < ApplicationRecord
  belongs_to :doctor, class_name: "User"
  belongs_to :patient, class_name: "User"

  validates :title, presence: true
  validates :description, presence: true
end
