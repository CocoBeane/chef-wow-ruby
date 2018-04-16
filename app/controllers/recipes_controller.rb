class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.save
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name)
  end

end
