class CreateRecipeIngredientJoins < ActiveRecord::Migration[5.1]
  def change
    create_table :recipe_ingredient_joins do |t|
      t.references :recipe
      t.references :ingredient

      t.timestamps
    end
  end
end
