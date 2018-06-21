class Ingredient < ApplicationRecord
  has_many :recipe_ingredient_joins
  has_many :recipes, :through => :recipe_ingredient_joins

  def in_recipe?
    recipes.size > 0
  end
end
