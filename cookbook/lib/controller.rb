require_relative 'recipe'
require_relative 'view'

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
