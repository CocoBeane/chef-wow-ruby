class RecipesController < ApplicationController

include RecipesHelper

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(creation_params)
    if @recipe.save
      flash[:success] = "Recipe saved"
      redirect_to recipe_path(@recipe)
    else
      flash.now[:error] = "Error! Recipe not saved"
    end
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
