class MealView
  def display(meals)
    meals.each do |meal|
      puts "#{meal.id} - #{meal.name} - #{meal.price}"
    end
  end

  def ask_for(item)
    puts "Which #{item}?"
    print ">"
    return gets.chomp
  end
end
