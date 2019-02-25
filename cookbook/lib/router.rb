# require_relative view.rb
# require_relative repository.rb


class Router

  def initialize(controller)
    @controller = controller
    @response = 0
  end

  def run
    while @response != 5 do
      base_menu
      @response = gets.chomp.to_i
      case
        when @response == 1
          @controller.list

        when @response == 2
          puts "call add function"
        when @response == 3
          puts "call update function"
        when @response == 4
          puts "call delete function"
      end
    end


  end



  def base_menu
    puts "1 - List all recipes"
    puts "2 - Add a new recipe"
    puts "3 - Update and existing recipe"
    puts "4 - Delete a recipe"
    puts "5 - exit press (5)"
  end



end
