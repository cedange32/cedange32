class View
  def display_recipes(recipes, options = {})
    show_tested_mark = options[:show_tested_mark] || false

    recipes.each_with_index do |recipe, index|
      done = show_tested_mark ? (recipe.done ? "[X] " : "[ ] ") : ""
      puts "#{index + 1}. #{done}#{recipe.name} - #{recipe.description} (#{recipe.difficulty}/5)"
    end
  end

  # def display_recipes(recipes)
  #   recipes.each_with_index do |recipe, index|
  #     puts "#{index + 1}. #{recipe.name} - #{recipe.description} (#{recipe.difficulty}/5)"
  #   end
  # end

  def ask_user_for_recipe_name
    ask_user_for "Name"
  end

  def ask_user_for_recipe_description
    ask_user_for "Description"
  end

  def ask_user_for_recipe_index
    ask_user_for("Recipe id").to_i - 1
  end

  def ask_user_for_recipe_difficulty
    ask_user_for("Difficulty (1 to 5)").to_i
  end

  def say_dummy
    puts "Dummy!"
  end

  def ask_user_for_ingredient
    ask_user_for 'Ingredient'
  end

  # DRY
  # Don't Repeat Yourself

  private

  def ask_user_for(label)
    puts "#{label}?"
    print "> "
    return gets.chomp
  end
end
