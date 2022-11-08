class Patient
  attr_reader :name, :cured
  attr_accessor :id, :room

  def initialize(attributes = {})
    @name = attributes[:name]
    @cured = attributes[:cured] || false
  end

  # lembrando que attr_reader :name é o mesmo que
  # def name
  #   @name
  # end

  # lembrando que attr_writer :name é o mesmo que
  # def name=(new_name)
  #   @name = new_name
  # end

  # e que attr_accessor :name nos dá ambos os métodos!

  def cure! # comportamento de TODO paciente. TODO paciente pode ser curado
    @cured = true
  end
end

# luiz = Patient.new(name: "Luiz", cured: true)

# luiz.name
# luiz.cured
# luiz.cure!

# puts "#{luiz.name} está #{luiz.cured ? 'curado' : 'doente'}"
# luiz.cure!
# puts "#{luiz.name} está #{luiz.cured ? 'curado' : 'doente'}"

# luiz.room
# luiz.room.id
# luiz.room.name
# luiz.room.capacity
