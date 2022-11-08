class Recipe # Modelo, onde está nossa lógica de negócio
end

# Comportamento -> São os métodos, como as instâncias interagem com código
# Estado        -> São as variáveis de instância, os "dados"

class Cookbook  # RecipeRepository -> Nos ajuda a falar com o Banco de Dados (CSV)
  # initialize
  # load_csv -> Quando o programa abre, carrega as informações do CSV para um
  #             array de instâncias de Recipe
  # save_csv -> Quando o programa muda alguma coisa do array de instâncias de
  #             Recipe, sobrescreve o CSV com as novas informações
end

# gerencia, define métodos que outros arquivos utilizam, controla...
class Controller # Onde cada USER ACTION é definida
  # MÉTODO dentro de controller, nós chamamos de AÇÃO

  # add_recipe
  # remove_recipe
  # update_recipe
  # list_recipe
  # import_recipe
end

# Comunicação com o Usuário
class View
end

# Recebe a entrada do usuário (input 1, input 2, input 3) e encontra o controller
# correto para executar a ação, e executa ela!
class Router
end

# Executa a aplicação
class App
end

# DE MANEIRA GERAL, enquanto no curso
# 1 model -> 1 repository -> 1 controller -> 1 view
# Lembrando que isso NÃO é uma regra.
