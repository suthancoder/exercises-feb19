require 'nokogiri'
require 'open-uri'
require_relative 'recipe.rb'

# file = '../data/fraise.html'
# file1 = '../data/strawberry.html'
# html_doc = Nokogiri::HTML(File.open(file), nil, 'utf-8')

# url = "file://Users/suthan/code/suthancoder/exercises/exercises-feb19/cookbook/data/strawberry.html"

# url1 = "https://www.bbc.co.uk/search?q=bitcoin"

# url2 = "file:///Users/suthan/code/suthancoder/exercises/exercises-feb19/cookbook/data/fraise.html"

# url3 = "http://www.letscookfrench.com/recipes/find-recipe.aspx?aqt=strawberry"

# string_doc = Nokogiri::HTML(open(file1), nil, 'utf-8')


# puts string_doc.xpath("//div[@class='m_contenu_resultat']")[0].xpath("//div[@class='m_titre_resultat']").text.strip

# puts string_doc.xpath("//div[@class='.recette_classique']")[0].text.strip

class LetsCook

  def initialize(attributes = {})
    @ingredient = attributes[:ingredient]
    @url = "http://www.letscookfrench.com/recipes/find-recipe.aspx?aqt=#{@ingredient}"
    @string_doc = Nokogiri::HTML(open(@url), nil, 'utf-8')
  end

  def import_recipe(choice)
    element = @string_doc.search(".recette_classique")[choice]
    return create_recipe(element)
  end


  def get_titles
    recipe_title_array = []
    @string_doc.search(".recette_classique").each do |element|
      name = element.search(".m_titre_resultat a").text.strip
      recipe_title_array << name
    end
    return recipe_title_array
  end

  def create_recipe(element)
    name = element.search(".m_titre_resultat").text.strip
    description = element.search(".m_texte_resultat").text.strip
    prep_time = element.search(".m_detail_time").text.strip
    recipe = Recipe.new(name: name, description: description, prep_time: prep_time)
    return recipe
  end
end





