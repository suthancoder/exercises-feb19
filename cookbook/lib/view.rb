class View
  def display(array)
    array.each_with_index do |recipe, index|
      puts "#{index} #{recipe.name} #{recipe.description}"
    end
  end

  def ask_user_for(item)
    puts "Please provide the #{item}"
    return gets.chomp
  end

  def import_display(array)
    array.each_with_index do |recipe, index|
      puts "#{index} #{recipe}"
    end
  end

  def edit_recipe
  end
end
