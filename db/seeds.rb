# Criação de hospitais de exemplo
hospital_a = Hospital.create(name: "Centro Médico Esperança")
hospital_b = Hospital.create(name: "Hospital da Vida")
hospital_c = Hospital.create(name: "Clínica Serenidade")
hospital_d = Hospital.create(name: "Centro Hospitalar Renovação")

# Criação de 20 médicos
20.times do
  doctor = User.create(
    email: Faker::Internet.unique.email,
    password: "123123",
    name: Faker::Name.name,
    phone_number: Faker::PhoneNumber.phone_number
  )
  UserHospital.create(user: doctor, hospital: [hospital_a, hospital_b, hospital_c, hospital_d].sample, role: "doctor")
end

# Criação de 50 pacientes
50.times do
  patient = User.create(
    email: Faker::Internet.unique.email,
    password: "123123",
    name: Faker::Name.name,
    phone_number: Faker::PhoneNumber.phone_number
  )
  UserHospital.create(user: patient, hospital: [hospital_a, hospital_b, hospital_c, hospital_d].sample, role: "patient")
end

# Criação de 100 exames
exame_descriptions = [
  "Exame de sangue completo",
  "Ressonância magnética do cérebro",
  "Tomografia computadorizada do tórax",
  "Ultrassonografia abdominal",
  "Endoscopia digestiva alta",
  "Colonoscopia",
  "Ecocardiograma",
  "Raio-X do joelho",
  "Teste de esforço cardíaco",
  "Eletroencefalograma",
  "Exame de urina",
  "Hemograma",
  "Mamografia"
]

100.times do
  exame = Exame.create(
    description: exame_descriptions.sample,
    doctor_id: User.joins(:user_hospitals).where(user_hospitals: { role: "doctor" }).sample.id,
    patient_id: User.joins(:user_hospitals).where(user_hospitals: { role: "patient" }).sample.id
  )
end
