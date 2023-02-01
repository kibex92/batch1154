class MealsView
  def display(meals)
    meals.each_with_index do |meal, index|
      puts "#{index + 1}. #{meal.name} - #{meal.price}€"
    end
  end

  def ask_user_for(input)
    puts "What's the #{input}?"
    gets.chomp
  end
  
  def ask_user_for_price
    ask_user_for("price").to_i
  end
  
  def ask_for_index
    ask_user_for("number").to_i - 1
  end
end