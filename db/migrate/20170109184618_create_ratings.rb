class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :user_id,null: false
      t.integer :recipe_id,null: false
      t.integer :rating_value

      t.timestamps null: false
    end
  end
end
