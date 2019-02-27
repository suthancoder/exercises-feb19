require_relative 'recipe'
require_relative 'view'
require_relative 'scrape.rb'

class Controller

  def initialize (cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    display_all
  end

  def add
    recipe = user_recipe
    @cookbook.add(recipe)
  end


  def update
    display_all
    choice = @view.ask_user_for("number of item to be updated")
    @cookbook.remove(choice.to_i)
    recipe = user_recipe
    @cookbook.update(choice.to_i, recipe)
  end

  def destroy
    display_all
    choice = @view.ask_user_for("number of item to be deleted")
    @cookbook.remove(choice.to_i)
    display_all
  end

  def import
    ingredient = @view.ask_user_for("ingredient you wish to search for")
    puts "Searching Let's Cook for #{ingredient} related recipes"
    ingredient_search = LetsCook.new(ingredient: ingredient)
    titles_list = ingredient_search.get_titles
    @view.import_display(titles_list)
    choice = @view.ask_user_for("number for your choice")
    puts "Importing recipe for #{titles_list[choice.to_i]}"
    recipe = ingredient_search.import_recipe(choice.to_i)
    @cookbook.add(recipe)
  end


  private
  def display_all
    recipes = @cookbook.all
    @view.display(recipes)
  end

  def user_recipe
    recipe_array = []
    recipe_array[0] = @view.ask_user_for("name")
    recipe_array[1] = @view.ask_user_for("descrption")
    recipe_array[2] = @view.ask_user_for("preparation time")
    new_recipe = Recipe.new(name: recipe_array[0], description: recipe_array[1], prep_time: recipe_array[2])
    return new_recipe
  end
end
