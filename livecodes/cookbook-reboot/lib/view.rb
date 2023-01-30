class View
  def ask_user_for(stuff)
    puts "What's the #{stuff} of the recipe"
    gets.chomp
  end

  def display_list(recipes)
    recipes.each_with_index do |recipe, index|
      status = recipe.done? ? "[X]" : "[ ]"
      puts "#{index + 1}. #{status} #{recipe.name} - #{recipe.description} (#{recipe.rating}/5) Prep: #{recipe.prep}"
    end
  end

  def ask_user_for_index
    puts "What's the number of the recipe?"
    gets.chomp.to_i - 1
  end

  def ask_user_for_searchterm
    puts "What do you want to search for?"
    gets.chomp
  end
end