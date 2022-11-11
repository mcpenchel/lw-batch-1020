require_relative '../models/meal'
require_relative '../views/meals_view'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = MealsView.new
  end

  def add
    # [VIEW] Perguntar para o usuário qual o nome do prato (e salvar em uma var)
    name = @view.ask_for_name
    # [VIEW] Perguntar para o usuário qual o preço do prato (e salvar em uma var)
    price = @view.ask_for_price

    # [MODEL] Teremos que de criar essa nova Meal
    meal = Meal.new(name: name, price: price)
    # [REPOSITORY] e jogar dentro daquele array de @meals
    @meal_repository.create(meal)
  end

  def list
    # [REPOSITORY] Pegar todas as meals do repositório
    meals = @meal_repository.all
    # [VIEW] Listar / Mostrar todas as meals
    @view.list(meals)
  end
end
