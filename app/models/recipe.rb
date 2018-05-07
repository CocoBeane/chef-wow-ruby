class Recipe < ApplicationRecord
  has_many :recipe_ingredient_joins
  has_many :ingredients, :through => :recipe_ingredient_joins
end
