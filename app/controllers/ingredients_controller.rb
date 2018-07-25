class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all 
  end

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

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
    render :edit
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.update(ingredient_params)
      flash[:success] = "Ingredient updated"
      redirect_to ingredient_path
    else
      flash.now[:error] = "Error! Ingredient not saved"
    end
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy
    redirect_to ingredients_path
  end

  private

    def ingredient_params
      params.require(:ingredient).permit(:name, :image_url, :description)
    end

end
