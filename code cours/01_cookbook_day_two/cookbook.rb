require "csv"

class Cookbook
  attr_reader :recipes

  def initialize(csv_file)
    @recipes = []
    @csv_file = csv_file
    load_csv
  end

  def add_recipe(recipe)
    @recipes << recipe
    save_to_csv
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    save_to_csv
  end

  def mark_recipe_as_done(index)
    @recipes[index].mark_as_done
    save_to_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file) do |row| # Array
      attributes = {
        name: row[0],
        description: row[1],
        difficulty: row[2].to_i,
        done: (row[3] == "true")
      }
      @recipes << Recipe.new(attributes)
    end
  end

  def save_to_csv
    CSV.open(@csv_file, 'w') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.difficulty, recipe.done.to_s]
      end
    end
  end
end
