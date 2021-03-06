class RecipesController < ApplicationController

include RecipesHelper
  def index
    @recipes = Recipe.all 
  end

  def new
    @recipe = Recipe.new
    @recipe.recipe_ingredient_joins.build
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      flash[:success] = "Recipe saved"
      redirect_to recipe_path(@recipe)
    else
      flash.now[:error] = "Error! Recipe not saved"
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
    render :edit
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(creation_params)
      flash[:success] = "Recipe updated"
      redirect_to recipe_path
    else
      flash.now[:error] = "Error! Recipe not saved"
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end

  private

    def recipe_params
      params.require(:recipe).permit(:name, 
        recipe_ingredient_joins_attributes:[:ingredient_id, :quantity, :unit])
    end

end
