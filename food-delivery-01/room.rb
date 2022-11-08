require_relative 'patient'

class Room
  attr_accessor :id
  attr_reader :patients, :name

  def initialize(attributes = {})
    @id       = attributes[:id]
    @name     = attributes[:name]
    @capacity = attributes[:capacity] || 0
    @patients = attributes[:patients] || [] # array de instâncias de Patient
  end

  def full?
    @capacity == @patients.size
  end

  # if condition
  # else
  # end

  # condition ? code_if_true : code_if_false

  # some_code if condition

  def add_patient(patient)
    raise StandardError, 'Room is full!' if full?

    patient.room = self
    @patients << patient
  end
end

heavy_metal_room = Room.new(id: 1, name: 'Narcoticos Anonimos', capacity: 3)

ozzy = Patient.new(name: "Ozzy Osbourne", cured: false)
hendrix = Patient.new(name: "Jimi Hendrix", cured: true)
simone = Patient.new(name: "Nina Simone", cured: true)
janis = Patient.new(name: "Janis Joplin", cured: true)

heavy_metal_room.add_patient(ozzy)
heavy_metal_room.add_patient(hendrix)

# Method Chaining

# "0".to_i.to_s.to_i.to_s.to_i.to_s

# zero_inteiro = "0".to_i
# zero_string = zero_inteiro.to_s

heavy_metal_room.patients.each do |patient|
  puts "A/o paciente #{patient.name} está internada/o"
end

heavy_metal_room.add_patient(simone)

puts "O #{ozzy.name} está internado no quarto #{ozzy.room.name}"

p ozzy
