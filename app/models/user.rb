class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :user_hospitals
  has_many :hospitals, through: :user_hospitals, class_name: 'Hospital'

  has_many :doctor_exames, class_name: 'Exame', foreign_key: 'doctor_id'
  has_many :patient_exames, class_name: 'Exame', foreign_key: 'patient_id'


  def doctor_exames
    Exame.all
  end
  def doctor?
    user_hospitals.exists?(role: 'doctor')
  end

  def patient?
    user_hospitals.exists?(role: 'patient')
  end

  def patient_exames
    Exame.joins(:patient).where(patient: { id: id })
  end
end
