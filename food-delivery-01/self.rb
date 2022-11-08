require 'byebug'

class Patient
  def initialize(attributes = {})
    @name = attributes[:name]
    @age  = attributes[:age]
  end

  def qualquer_coisa # método de instância
    # Este é o contexto da instância sobre a qual o método foi chamado
    # lá na linha 29.. E depois vai entrar aqui de novo na linha 34
    byebug

    puts "Fazendo alguma coisa..."
  end

  def self.qualquer_coisa # método de classe

    puts "Fazendo alguma coisa..."
  end


  def self.outro_metodo_de_classe
  end
end

luiz = Patient.new(name: "Luiz", age: 50)

luiz.qualquer_coisa # método da linha 9

Patient.qualquer_coisa # método da linha 17

milena = Patient.new(name: "Milena", age: 18)
milena.qualquer_coisa
