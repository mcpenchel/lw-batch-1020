# frozen_string_literal: true

class MealRepository
  # It reads and writes the meals from the CSV file and holds them as objects in an array.
  def initialize(csv_file_path)
    @meals = []
    @csv_file_path = csv_file_path
    load_csv if File.exist?(@csv_file_path)
  end

  # create a new meal]
  def create(meal)
    # if @meals.empty?
    #   meal.id = 1
    # else
    #   meal.id = @meals.last.id + 1
    # end

    # variavel = condition ? value_if_true : value_if_false
    meal.id = @meals.empty? ? 1 : @meals.last.id + 1

    @meals << meal
    save_csv
  end

  # Get all the meals
  def all
    @meals
  end

  # find a specific meal thanks to its id
  def find(meal_id)
    @meals.find do |meal|
      meal.id == meal_id
    end
  end

  private

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << %w[id name price]
      # devo eu colocar isso dentro ou fora do loop?
      # resposta: esse comando deve ser executado + de uma vez?
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end

  def load_csv
    # CSV.foreach(@csv_file_path, headers: :first_row) do |row|
    #   @meals << Meal.new(id: row['id'].to_i, name: row['name'], price: row['price'].to_i)
    # end

    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      row[:id]    = row[:id].to_i
      row[:price] = row[:price].to_i

      @meals << Meal.new(row)
    end
  end
end
