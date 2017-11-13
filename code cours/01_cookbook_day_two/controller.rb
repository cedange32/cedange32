require_relative "recipe"
require_relative "view"
require_relative "scraper"

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
    @scraper = Scraper.new
  end

  def list
    recipes = @cookbook.recipes
    @view.display_recipes(recipes, show_tested_mark: true)
  end

  def create
    name = @view.ask_user_for_recipe_name
    description = @view.ask_user_for_recipe_description

    difficulty = @view.ask_user_for_recipe_difficulty
    recipe = Recipe.new(name: name, description: description, difficulty: difficulty)

    if recipe.valid?
      @cookbook.add_recipe(recipe)
    else
      @view.say_dummy
      create
    end
  end

  def destroy
    list
    index = @view.ask_user_for_recipe_index
    @cookbook.remove_recipe(index)
  end

  def import_recipe
    ingredient = @view.ask_user_for_ingredient
    imported_recipes = @scraper.parse(ingredient)
    @view.display_recipes(imported_recipes)
    index = @view.ask_user_for_recipe_index
    imported_recipe = imported_recipes[index]
    @cookbook.add_recipe(imported_recipe)
  end

  def mark_as_done
    list
    index = @view.ask_user_for_recipe_index
    @cookbook.mark_recipe_as_done(index)
  end
end
