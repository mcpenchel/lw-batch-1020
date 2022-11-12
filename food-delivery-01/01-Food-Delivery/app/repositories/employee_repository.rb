require 'csv'
require_relative '../models/employee'

class EmployeeRepository
  def initialize(csv_file_path)
    @employees = []
    @csv_file_path = csv_file_path
    load_csv if File.exists?(@csv_file_path)
  end

  # Se não tem escrita,
  # não tem def create ou def add.
  # Se não tem def create ou def add, não tem save_csv.

  def all_riders
    # Exemplo de como escrever a mesma coisa multi-line block
    # (que a gente usa quando tem + de 1 linha, e esse não é o caso)
    # @employees.select do |employee|
    #   employee.role == 'rider'
    # end

    @employees.select { |employee| employee.role == 'rider' }
  end

  def find(id)
    @employees.find { |employee| employee.id == id }
  end

  def find_by_username(username)
    @employees.find { |employee| employee.username == username }
  end

  private
  def load_csv
    # HOJE fazemos leitura de CSV
    # AMANHÃ podemos trocar, e fazer leitura de XML
    # ou de JSON
    # ou de BD...
    #
    # Por isso que é um método privado, nenhuma outra classe tem que se meter
    # em como o EmployeeRepository carrega a informação para um array de instâncias.

    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      row[:id]    = row[:id].to_i

      @employees << Employee.new(row)
    end
  end
end

# It has a read-only logic
# empty_repo = EmployeeRepository.new('algum/caminho/para/o/arquivo.csv')

# p empty_repo # Eu espero ver no terminal a instância do meu repositório, com o
# @employees preenchido corretamente. Isso vai querer dizer que o meu load_csv
# funcionou como eu queria.

# filled_repo = EmployeeRepository.new('data/employees.csv')

# p filled_repo

# p filled_repo.all_riders

# luiz = filled_repo.find(1)

# p luiz

# exodus = filled_repo.find_by_username('exodus')
# p exodus
