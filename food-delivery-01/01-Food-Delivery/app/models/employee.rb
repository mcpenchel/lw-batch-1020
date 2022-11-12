class Employee
  attr_reader :role, :id, :username, :password
  def initialize(attributes = {})
    @id = attributes[:id]
    @username = attributes[:username]
    @password = attributes[:password]
    @role = attributes[:role]
  end
end

# luiz = Employee.new(
#   id: 1, username: 'luiz.vapes', password: '123456', role: 'manager'
# )

# milena = Employee.new(
#   id: 2, username: 'milena.movies', password: 'starw4rs', role: 'manager'
# )

# caio = Employee.new(
#   id: 3, username: 'poke.caio', password: 'pok3m0n', role: 'rider'
# )

# exodus = Employee.new(
#   id: 4, username: 'exodus', password: 'damnation', role: 'rider'
# )

# p luiz
# p milena
# p caio
# p exodus
