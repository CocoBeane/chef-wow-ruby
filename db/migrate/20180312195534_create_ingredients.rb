class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :image_url
      t.text :description

      t.timestamps
    end
  end
end