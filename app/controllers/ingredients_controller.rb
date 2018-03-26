class IngredientsController < ApplicationController
  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.save
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :image_url, :description)
  end

end
