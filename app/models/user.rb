class User < ApplicationRecord
  before_validation :normalize_phone_number, on: :create

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :user_hospitals
  has_many :hospitals, through: :user_hospitals, class_name: 'Hospital'
  has_many :doctor_exames, class_name: 'Exame', foreign_key: 'doctor_id'
  has_many :patient_exames, class_name: 'Exame', foreign_key: 'patient_id'

  validates :name, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true

  accepts_nested_attributes_for :user_hospitals

  def self.doctors
    joins(:user_hospitals).where(user_hospitals: { role: 'doctor' })
  end

  def self.patients
    joins(:user_hospitals).where(user_hospitals: { role: 'patient' })
  end

  def normalize_phone_number
    self.phone_number = PhoneNormalizerService.normalize(phone_number)
  end

  def doctor?
    user_hospitals.exists?(role: 'doctor')
  end

  def patient?
    user_hospitals.exists?(role: 'patient')
  end

  def exames
    Exame.where('doctor_id = ? OR patient_id = ?', id, id)
  end

  def doctor_exames
    Exame.joins(:doctor).where(doctor: { id: id })
  end

  def patient_exames
    Exame.joins(:patient).where(patient: { id: id })
  end
end
