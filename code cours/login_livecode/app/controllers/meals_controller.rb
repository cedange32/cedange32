require_relative('../views/meal_view')
class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = MealView.new
  end

  def list
    meals = @meal_repository.all
    @view.display(meals)
  end

  def add
    # ask name
    name = @view.ask_for('name')
    #ask price
    price = @view.ask_for('price').to_i
    # create meal
    meal = Meal.new(name: name, price: price)
    # save meal
    @meal_repository.add(meal)
  end
end
