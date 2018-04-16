class RecipeIngredientJoin < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient
end
