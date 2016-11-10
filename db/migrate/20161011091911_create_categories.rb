class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :category_type, limit: 50, null: false

      t.timestamps null: false
    end
  end
end
