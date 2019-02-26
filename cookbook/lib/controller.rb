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
    name = @view.ask_user_for("name")
    description = @view.ask_user_for("descrption")
    prep_time = @view.ask_user_for("preparation time")
    recipe = Recipe.new(name: name, description: description, prep_time: prep_time)
    @cookbook.add(recipe)
  end


  def update
    display_all
    choice = @view.ask_user_for("number of item to be updated")
    recipe = @cookbook.all[choice.to_i]
    name = @view.ask_user_for("name")
    recipe.name = name
    recipe.description = @view.ask_user_for("descrption")
    recipe.prep_time = @view.ask_user_for("preparation time")
    @cookbook.add(recipe)
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
end
