# frozen_string_literal: true

class MealsView
  def ask_for_name
    puts 'What\'s the meal name?'
    gets.chomp
  end

  def ask_for_price
    puts 'What\'s the price?'
    gets.chomp.to_i
  end

  def list(meals)
    meals.each do |meal|
      puts "#{meal.id}. #{meal.name} (R$ #{meal.price})"
    end
  end
end
