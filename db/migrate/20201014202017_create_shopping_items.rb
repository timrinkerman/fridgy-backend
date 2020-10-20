class CreateShoppingItems < ActiveRecord::Migration[6.0]
  def change
    create_table :shopping_items do |t|
      t.string :recipe
      t.text :name
      t.integer :user_id
      t.timestamps
    end
  end
end
