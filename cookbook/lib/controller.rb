require_relative 'recipe'

class Controller

  def initialize (cookbook)
    @cookbook = cookbook
  end

  def list
    puts "controller list function"
    # recipes = @cookbook.all
  end

  def add
    puts "controller add function"
  end


  def create
    puts "controller create function"
    # @recipe.new
    # @view.add_recipe
  end

  def destroy
    puts "controller destroy function"
  end

end
