class CreateUserRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :user_recipes do |t|
      t.string :title
      t.text :ingredients
      t.string :sourceUrl
      t.string :image
      t.integer :user_id

      t.timestamps
    end
  end
end
