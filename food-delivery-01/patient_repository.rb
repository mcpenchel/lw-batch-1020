class PatientRepository

  def initialize(room_repository)
    @room_repository = room_repository
  end

  def load_csv
    CSV.foreach('') do |row|
      patient = Patient.new

      patient.id   = row[:id].to_i
      patient.name = row[:name]

      # patient.cured = row[:cured] # "true" ou "false"
      if row[:cured] == "true"
        patient.cured = true
      else
        patient.cured = false
      end

      room_id = row[:room_id]

      room = @room_repository.find(room_id)

      patient.room = room
    end
  end

  def save_csv
  end
end
