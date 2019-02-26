require 'csv'
require_relative 'recipe'

class Cookbook

  def initialize(csv_file)
    @recipes = []
    @csv_file = csv_file
    load_csv
  end

  def all
    puts "cookbook all function"
    return @recipes
  end

  def add(recipe)
    @recipes << recipe
    save_csv
  end

  def remove(choice)
    @recipes.delete_at(choice)
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:done] = row[:done] == "true"
      @recipes << Recipe.new(row)
    end
  end

  def save_csv
    CSV.open(@csv_file, "wb") do |csv|
      csv << ["name", "description", "prep_time", "done"]
      @recipes.each do |recipe|
      csv << [recipe.name, recipe.description, recipe.prep_time, recipe.done?]
      end
    end
  end
end
