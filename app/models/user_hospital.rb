class UserHospital < ApplicationRecord
  belongs_to :user
  belongs_to :hospital

  enum role: { doctor: 0, patient: 1}
end
