require_relative 'patient_repository'
require_relative 'room_repository'

room_repo = RoomRepository.new("rooms.csv")
patient_repo = PatientRepository.new("patients.csv", room_repo)


can = Patient.new(name: "Can")
patient_repo.add_patient(can)

p patient_repo.all