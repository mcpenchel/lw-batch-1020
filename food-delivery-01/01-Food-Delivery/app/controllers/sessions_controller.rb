# frozen_string_literal: true

require_relative '../views/sessions_view'

class SessionsController
  def initialize(employee_repository)
    @view = SessionsView.new
    @employee_repository = employee_repository
  end

  # Ação de Usuário responsável por:
  # 1 - Pedir username
  # 2 - Pedir senha
  # 3 - Verificar: bateu? Loga @ usuári@, iniciando sua sessão no app
  #                não bateu? Repita 1 e 2 de novo.
  def sign_in
    username = @view.ask_for_username
    password = @view.ask_for_password

    employee = @employee_repository.find_by_username(username)

    # Preciso ver se employee existe
    # Preciso comparar a senha employee.password com a variável local password
    if employee && employee.password == password
      @view.successfull_sign_in(employee)

      employee
    else
      @view.wrong_credentials

      # Recursividade
      #
      # Usamos quando queremos que um mesmo método seja executado ATÉ QUE
      # uma condição seja satisfeita.
      #
      # Recursividade NÃO VAI SUBSTITUIR 99.9% dos loops que nós usamos.
      # "Recursividade NÃO É BRINCADEIRA" - Victor Hugo "Exodus" Brandão
      #
      # Para sair do loop eterno, é o RETURN que vai fazer isso!!!!!
      # No else, chame o próprio nome do método para iniciar a recurividade
      sign_in # Recursão ou Recursividade
    end
  end
end
