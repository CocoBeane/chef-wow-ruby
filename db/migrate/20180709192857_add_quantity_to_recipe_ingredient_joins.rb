class AddQuantityToRecipeIngredientJoins < ActiveRecord::Migration[5.1]
  def change
    add_column :recipe_ingredient_joins, :quantity, :integer
    add_column :recipe_ingredient_joins, :unit, :string
  end
end
