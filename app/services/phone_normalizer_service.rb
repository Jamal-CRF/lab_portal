require 'phonelib'

class PhoneNormalizerService
  def self.normalize(phone_number)
    phone = Phonelib.parse(phone_number)
    normalized_number = phone.international
    normalized_number
  end
end
