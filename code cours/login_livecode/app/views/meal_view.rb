class MealView
  def display(meals)
    puts
    puts "Meals list"
    meals.each do |meal|
      puts "#{meal.id} - #{meal.name} - #{meal.price}"
    end
  end

  def ask_for(item)
    puts
    puts "Which #{item}?"
    print ">"
    return gets.chomp
  end
end
