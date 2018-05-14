class IngredientsController < ApplicationController
  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      flash[:success] = "Ingredient saved"
      redirect_to ingredient_path(@ingredient)
    else
      flash.now[:error] = "Error! Ingredient not saved"
    end
  end

  def index
    @ingredients = Ingredient.all 
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :image_url, :description)
  end

end
