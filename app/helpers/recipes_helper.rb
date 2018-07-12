module RecipesHelper

  def options_for_ingredients
    Ingredient.all.pluck(:name, :id)
  end

  def selected_recipe_ingredients
    @recipe.ingredients.pluck(:id)
  end

  def creation_params
    {
      name: recipe_params["name"],
      ingredient_ids: recipe_params["ingredients"]
    }
  end 

end
