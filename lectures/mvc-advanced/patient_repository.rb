require 'csv'
require_relative 'patient'

class PatientRepository
  # STATE
  # - patients
  # - csv_file

  def initialize(csv_file_path, room_repository)
    @csv_file_path = csv_file_path
    @room_repository = room_repository
    @next_id = 1
    @patients = []
    load_csv
  end

  def add_patient(patient)
    patient.id = @next_id
    @next_id += 1
    @patients << patient
    # save_csv
  end

  def all
    @patients
  end

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      row[:cured] = row[:cured] == "true"
      row[:room_id] = row[:room_id].to_i
      room = @room_repository.find(row[:room_id])
      
      patient = Patient.new(row)
      patient.room = room
      room.add_patient(patient)
      @patients << patient
    end
    @next_id = @patients.last.id + 1 unless @patients.empty?
  end
end
