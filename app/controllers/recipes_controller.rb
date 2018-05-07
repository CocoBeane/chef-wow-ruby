class RecipesController < ApplicationController

include RecipesHelper

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(creation_params)
    @recipe.save
  end

  def index
    @recipes = Recipe.all 
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, ingredients:[])
  end

end
