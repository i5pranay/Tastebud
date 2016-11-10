class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :recipe_name,limit: 100, null: false
      t.integer :user_id, null: false
      t.integer :category_id, null: false
      t.text :content, null: false

      t.timestamps null: false
    end
  end
end
